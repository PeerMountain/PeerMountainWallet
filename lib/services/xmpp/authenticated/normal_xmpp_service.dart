import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/app/globals.dart';
import 'package:kyc3/generated/com/kyc3/message.pb.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/services/xmpp/src/xmpp_core.dart';
import 'package:kyc3/utils/app_events.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

import '../src/xmpp_utils.dart';

export 'normal_receive_service.dart';
export 'normal_send_service.dart';

/// This class is ONLY used for connection user to NORMAL channel.
///
/// All of the messages send process has been implemented in
/// *[NormalSendService].
///
/// All of the messages received process has been implemented in
/// *[NormalReceiveService].

/// Will be used for all of the api requests to be sent/received on NORMAL channel.
late NormalSendService normalSendService;
final normalReceiveService = NormalReceiveService.instance;

@singleton
class NormalXmppService {
  static xmpp.Connection? connection;

  void assertConnection() {
    assert(connection != null,
        "Connection object is null establish connection with server first and try again!!");
    assert(connection!.state == xmpp.XmppConnectionState.Ready,
        "Socket is not yet ready to send/receive messages try reconnecting socket connection with server!");
  }

  xmpp.MessageHandler get messageHandler => xmpp.MessageHandler.getInstance(connection!);

  xmpp.ChatManager get chatHandler => xmpp.ChatManager.getInstance(connection!);

  Future<void> openNormalXmppConnection({
    required String username,
    required String password,
    required Function(xmpp.XmppConnectionState) onConnectionStateChange,
  }) async {
    xmpp.Log.logXmpp = false;
    xmpp.Log.logLevel = xmpp.LogLevel.DEBUG;

    /// create JID from which we will send messages to the server
    final authUserJid = getUserJID(username);

    final account = xmpp.XmppAccountSettings(
      username,
      authUserJid.local,
      authUserJid.domain,
      password,
      XmppUtils.port,
      host: XmppUtils.host,
      resource: 'xmpp',
    );

    connection = xmpp.Connection(account)..getMamModule();
    connection!.connect();

    /// MUST
    /// WILL BE USED ALL OF THE REQUEST SENT TO XMPP SERVER
    normalSendService = NormalSendService(
      connection: connection!,
      userJID: XmppUtils.oracleJID,
      messageHandler: messageHandler,
    );

    showLog("NormalXmppChannel Initialized.");

    /// 1. To listen messages received from current authenticated server connection
    final messagesListener = PMOMessagesListener(
      onNewMessageReceived: (xmpp.MessageStanza? message) {
        if (message != null) {
          if (message.type == xmpp.MessageStanzaType.ERROR) {
            eventBus.fire(const GMEvent(status: false, from: '', error: 'Invalid message sent!'));
            return;
          }

          final from = message.fromJid!.userAtDomain.removeHost();

          if (message.body != null) {
            try {
              final response = GeneralMessage.fromBuffer(base64Decode(message.body!));
              final kMessage = XmppUtils.parseAndVerifyMessage(from: from, generalMessage: response);

              if (kMessage.isValid) {
                eventBus.fire(GMEvent(status: true, from: from, message: kMessage.message));
              } else {
                eventBus.fire(GMEvent(status: false, from: from, error: kMessage.error));
              }
            } catch (e, stackTrace) {
              // showLog("initXmppAuth exception =====>>> $e");
              // showLog("initXmppAuth stackTrace =====>>> $stackTrace");
              checkForChatMessages(message);
            }
          } else {
            eventBus.fire(GMEvent(status: false, from: from, error: 'Invalid response received!'));
          }
        } else {
          eventBus.fire(const GMEvent(status: false, from: '', error: 'Invalid message!'));
        }
      },
    );

    /// 2. To listen connection state of current authenticated server connection
    final connectionStateChangedListener = PMOConnectionStateChangedListener(
      connection!,
      messagesListener,
      onConnectionStateChange: (status) {
        showLog("XmppService onConnectionStateChange =====>>> $status");
        onConnectionStateChange(status);
      },
    );
  }

  xmpp.Jid getUserJID(String username) {
    final domain = '$username@${XmppUtils.host}';
    return xmpp.Jid.fromFullJid(domain);
  }

  Future<void> closeXmpp() async {
    assertConnection();
    connection!.close();
  }

  void checkForChatMessages(xmpp.MessageStanza? message) {
    final allConversations = hiveStorage.getAllConversations();

    if (message != null && allConversations != null) {
      KycContact? isAlreadyExist, foundContact;

      try {
        isAlreadyExist =
            allConversations.firstWhere((element) => element.blockchainAddress == message.fromJid!.local);
      } catch (e) {}

      /// add new conversation
      if (isAlreadyExist == null) {
        try {
          final allContacts = hiveStorage.getAllContacts();
          foundContact =
              allContacts?.firstWhere((element) => element.blockchainAddress == message.fromJid!.local);
          if (foundContact != null) {
            final contact = KycContact()
              ..blockchainAddress = message.fromJid!.local
              ..jid = message.fromJid!.local.addXmppKycHost()
              ..nickName = foundContact.nickName
              ..fullName = foundContact.fullName
              ..image = foundContact.image;
            hiveStorage.addConversations(contact);
          }
        } catch (e) {
          /// temp chat
        }
      } else {
        /// already exists do not add again
      }

      /// add message to user's chat messages list
    }
    eventBus.fire(ChatEvent(message: message!.body!, from: message.fromJid!.local));
  }
}
