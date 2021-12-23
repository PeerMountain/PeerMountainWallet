import 'package:kyc3/app/extensions/extensions.dart';
import 'package:kyc3/app/globals.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

class PMOMessagesListener implements xmpp.MessagesListener {
  final Function(xmpp.MessageStanza?) onNewMessageReceived;

  PMOMessagesListener({required this.onNewMessageReceived});

  @override
  void onNewMessage(xmpp.MessageStanza? message) {
    showLog("onNewMessage info =====>>> ${message?.logMessage(logBody: true)}");
    onNewMessageReceived.call(message);
  }
}
