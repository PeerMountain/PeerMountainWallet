import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/chat/chat_model.dart';
import 'package:kyc3/utils/app_utils.dart';
import 'package:kyc3/widgets/text_widget.dart';

class BaseMessage extends StatelessWidget {
  final ChatModel message;

  const BaseMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    final isSender = message.senderJid!.removeHost() == cryptoAccount.address!;
    switch (message.messageType) {
      case MessageType.payment:
        child = const SizedBox();
        break;
      case MessageType.request:
        child = const SizedBox();
        break;
      case MessageType.text:
      default:
        child = _textMessage(context);
    }

    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: child,
    );
  }

  Widget _textMessage(BuildContext context) {
    return Container(
      padding: p8.copyWith(bottom: 4),
      margin: p8.copyWith(bottom: 0.0),
      constraints: BoxConstraints(maxWidth: screenWidth * 0.8),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SelectableText(
            message.message!,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 14.0,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Texts(
              Utils.formatMillis(message.createdOn, format: "hh:mm a"),
              fontSize: 13.0,
              textAlign: TextAlign.end,
              color: context.subtitleColor,
            ),
          ),
        ],
      ),
    );
  }
}
