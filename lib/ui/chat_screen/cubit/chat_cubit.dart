import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/chat/chat_model.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/models/kyc_base_message.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/services/xmpp/authenticated/normal_chat_service.dart';
import 'package:kyc3/utils/export_utils.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState.initial());

  NormalChatService? chatService;

  StreamSubscription<ChatEvent>? subscription;
  String? address;

  void initSubscription() async {
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

  void initChatService({required String address}) {
    assert(subscription != null, "Subscription for this should not be null.");
    final authUserJid = normalXmppService.getUserJID(address);
    this.address = address;
    chatService = NormalChatService(
      userJID: authUserJid,
      connection: NormalXmppService.connection!,
      messageHandler: normalXmppService.messageHandler,
    );
  }

  void sendMessage(String message) {
    assert(chatService != null && subscription != null);
    final now = DateTime.now();
    final me = hiveStorage.getUser();

    /// if user has not set profile redirect him/her to set-up profile first
    /// otherwise continue with sending message
    if (me == null || me.nickName?.trim() == "" || me.fullName?.trim() == "") {
      navUtils.gotoUserProfileScreen(me);
      return;
    }
    final chatMessage = ChatModel(
      message: message,
      messageType: MessageType.text,
      createdOn: now.millisecondsSinceEpoch,
      updatedOn: now.millisecondsSinceEpoch,
      senderJid: cryptoAccount.address!.addXmppKycHost(),
      senderNickname: me.nickName,
      senderFullname: me.fullName,
    );
    emit(ChatState.success([...state.chats ?? [], chatMessage]));
    checkForConversationAdd();

    final baseMessage = KycBaseMessage(
      type: MessageType.chat.value,
      message: jsonEncode(chatMessage.toJson()),
    );

    chatService!.sendMessageToUser(message: jsonEncode(baseMessage));
  }

  void clear() {
    state.chats?.clear();
    emit(ChatState.success(state.chats ?? []));
  }

  void checkForConversationAdd() {
    final allConversations = hiveStorage.getAllConversations();
    KycContact? isAlreadyExist, foundContact;

    isAlreadyExist = allConversations?.firstWhereOrNull((element) => element.blockchainAddress == address);

    /// add new conversation
    if (isAlreadyExist == null) {
      final allContacts = hiveStorage.getAllContacts();
      foundContact = allContacts?.firstWhere((element) => element.blockchainAddress == address);
      if (foundContact != null) {
        hiveStorage.addConversations(foundContact);
      } else {
        showLog("checkForConversationAdd something went wrong!");
      }
    } else {
      /// already exists do not add again
    }
  }
}
