import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/chat/chat_model.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/services/xmpp/authenticated/normal_chat_service.dart';
import 'package:kyc3/utils/export_utils.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState.initial());

  NormalChatService? chatService;

  StreamSubscription<ChatEvent>? subscription;
  String? address;

  void init({required String address}) {
    final authUserJid = normalXmppService.getUserJID(address);
    this.address = address;
    chatService = NormalChatService(
      userJID: authUserJid,
      connection: NormalXmppService.connection!,
      messageHandler: normalXmppService.messageHandler,
    );

    subscription?.cancel();
    subscription = eventBus.on<ChatEvent>().listen((event) {
      final message = event.message;

      if (message != null) {
        var newMessages = <ChatModel>[];
        final oldMessages = state.chats ?? [];

        final chatMessage = ChatModel.fromJson(jsonDecode(event.message));

        newMessages = [...oldMessages, chatMessage];
        emit(ChatState.success(newMessages));
      }
    });
  }

  void sendMessage(String message) {
    assert(chatService != null && subscription != null);
    final now = DateTime.now();
    final chatMessage = ChatModel(
      message: message,
      messageType: MessageType.text,
      createdOn: now.millisecondsSinceEpoch,
      updatedOn: now.millisecondsSinceEpoch,
      senderJid: cryptoAccount.address!.addXmppKycHost(),
    );
    emit(ChatState.success([...state.chats ?? [], chatMessage]));
    checkForConversationAdd();
    chatService!.sendMessageToUser(message: chatMessage.encodeValues());
  }

  void clear() {
    state.chats?.clear();
    emit(ChatState.success(state.chats ?? []));
  }

  void checkForConversationAdd() {
    final allConversations = hiveStorage.getAllConversations();
    KycContact? isAlreadyExist, foundContact;

    try {
      isAlreadyExist = allConversations?.firstWhere((element) => element.blockchainAddress == address);
    } catch (e) {}

    /// add new conversation
    if (isAlreadyExist == null) {
      try {
        final allContacts = hiveStorage.getAllContacts();
        foundContact = allContacts?.firstWhere((element) => element.blockchainAddress == address);
        if (foundContact != null) {
          final contact = KycContact()
            ..blockchainAddress = foundContact.blockchainAddress
            ..jid = foundContact.blockchainAddress?.addXmppKycHost()
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
  }
}
