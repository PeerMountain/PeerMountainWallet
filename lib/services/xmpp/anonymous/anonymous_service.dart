import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/message.pb.dart';
import 'package:kyc3/services/xmpp/src/xmpp_core.dart';
import 'package:kyc3/utils/app_events.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;
import 'package:xmpp_stone/xmpp_stone.dart';

import '../../services.dart';

export 'anonymous_receive_service.dart';
export 'anonymous_send_service.dart';

/// This class is ONLY used for connection user to ANONYMOUS channel.
///
/// All of the messages send process has been implemented in
/// *[AnonymousSendService].
///
/// All of the messages received process has been implemented in
/// *[AnonymousReceiveService].

/// Will be used for all of the api requests to be sent/received on ANONYMOUS channel.
late AnonymousSendService anonymousSendService;
final anonymousReceiveService = AnonymousReceiveService.instance;

@singleton
class AnonymousService {
  xmpp.Connection? connection;

  Future<void> closeXmpp() async {
    connection!.close();
    anonymousSendService.closeXmpp();
    anonymousReceiveService.cancelSubscription();
  }

  xmpp.MessageHandler get messageHandler => xmpp.MessageHandler.getInstance(connection!);

  void sendMessage(String base64Request) {
    messageHandler.sendMessage(XmppUtils.oracleJID, base64Request);
  }

  void initXmppServer({
    VoidCallback? onReady,
    VoidCallback? onError,
    VoidCallback? onClosed,
  }) {
    /// for anonymous channel connection initialize response listeners.
    anonymousReceiveService.initResponseListeners();
    anonymousService.openAnonymousXmppConnection(
      onConnectionStateChange: (status) async {
        if (anonymousService.connection!.state == XmppConnectionState.Ready) {
          onReady?.call();
          return;
        }
        if (anonymousService.connection!.state == XmppConnectionState.AuthenticationFailure) {
          onError?.call();
          return;
        }

        if (anonymousService.connection!.state == XmppConnectionState.Closed) {
          onClosed?.call();
          return;
        }
      },
    );
  }

  /// Anonymous connection does not require any credentials
  /// to be passed on so we can pass any strings.
  Future<void> openAnonymousXmppConnection({
    required Function(xmpp.XmppConnectionState) onConnectionStateChange,
  }) async {
    xmpp.Log.logXmpp = false;
    xmpp.Log.logLevel = xmpp.LogLevel.DEBUG;

    const anonUserAtServer = XmppUtils.anonUserAtServer;

    xmpp.Jid anonymousJID = xmpp.Jid.fromFullJid(anonUserAtServer);

    final account = xmpp.XmppAccountSettings(
      anonUserAtServer,
      anonymousJID.local,
      anonymousJID.domain,
      '',
      XmppUtils.port,
      host: XmppUtils.anonymousHost,
      resource: 'xmpp',
    );

    connection = xmpp.Connection(account);
    connection!.connect();

    /// MUST
    /// WILL BE USED ALL OF THE REQUEST SENT TO ANONYMOUS XMPP CHANNEL ON SERVER
    anonymousSendService = AnonymousSendService(
      connection: connection!,
      userJID: XmppUtils.oracleJID,
      messageHandler: messageHandler,
    );

    addListeners(onConnectionStateChange: onConnectionStateChange);
  }

  void addListeners({required Function(xmpp.XmppConnectionState)? onConnectionStateChange}) {
    /// To listen messages received from server on anonymous connection
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
              showLog("initAnonymousXmpp exception =====>>> $e");
              showLog("initAnonymousXmpp exception stackTrace =====>>> $stackTrace");
            }
          } else {
            eventBus.fire(GMEvent(status: false, from: from, error: 'Invalid response received!'));
          }
        } else {
          eventBus.fire(const GMEvent(status: false, from: '', error: 'Invalid message!'));
        }
      },
    );

    /// To listen connection state of current anonymous server connection
    final connectionStateChangedListener = PMOConnectionStateChangedListener(
      connection!,
      messagesListener,
      onConnectionStateChange: (status) {
        onConnectionStateChange?.call(status);
      },
    );
  }
}
