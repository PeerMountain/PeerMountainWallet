import 'package:kyc3/services/services.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

/// All of the messages SENT through *[NormalXmppService]
/// has been handled in this class.

class NormalChatService {
  final xmpp.Connection connection;
  final xmpp.Jid userJID;
  final xmpp.MessageHandler messageHandler;

  NormalChatService({
    required this.connection,
    required this.userJID,
    required this.messageHandler,
  });

  Future<void> closeXmpp() async {
    connection.close();
  }

  void sendMessage(String? message) {
    if (message != null) {
      messageHandler.sendMessage(userJID, message);
    }
  }

  /// Send exchange key request message to server
  void sendMessageToUser({required String? message}) async {
    sendMessage(message);
  }
}
