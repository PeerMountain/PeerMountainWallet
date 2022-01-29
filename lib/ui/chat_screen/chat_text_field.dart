import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/ui/chat_screen/cubit/chat_cubit.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({Key? key}) : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final tcMessage = TextEditingController();
  final fcMessage = FocusNode();

  int numLines = 0;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();

    fcMessage.addListener(focusListener);
  }

  void focusListener() {
    if (fcMessage.hasFocus) {
      if (!hasFocus) {
        setState(() {
          hasFocus = true;
        });
      }
    } else {
      if (hasFocus) {
        setState(() {
          hasFocus = false;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    tcMessage.dispose();
    fcMessage.removeListener(focusListener);
    fcMessage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        // height: kToolbarHeight + 10,
        padding: p10,
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _payAndRequestButton(),
            // if (!hasFocus) w8,
            _dismissKeyboardButton(),
            if (hasFocus) w8,
            Expanded(
              key: const ValueKey('__chat_text_field_expanded__'),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 50),
                child: ValueListenableBuilder(
                  valueListenable: tcMessage,
                  builder: (context, value, child) {
                    double borderRadius = 20.0;

                    if (numLines == 0) {
                      borderRadius = 30.0;
                    } else if (numLines == 1) {
                      borderRadius = 25.0;
                    } else if (numLines == 2) {
                      borderRadius = 20.0;
                    }

                    numLines = tcMessage.text.lines;

                    return TextFormFieldWidget(
                      controller: tcMessage,
                      focusNode: fcMessage,
                      maxLines: 5,
                      key: const ValueKey('__chat_text_field__'),
                      textInputAction: TextInputAction.newline,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        borderSide: const BorderSide(color: Palette.accentColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 11.0,
                      ),
                    );
                  },
                ),
              ),
            ),
            if (hasFocus) w8,
            if (hasFocus) _sendMessageButton(),
          ],
        ),
      ),
    );
  }

  Widget _dismissKeyboardButton() {
    if (!hasFocus) {
      return const SizedBox();
    }
    return SizedBox(
      width: 40,
      height: 40,
      child: GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          child: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _payAndRequestButton() {
    return Row(
      children: [
        if (!hasFocus)
          SizedBox(
            height: 38,
            width: 80,
            child: FilledButton(
              onTap: () {},
              text: Strings.pay,
            ),
          ),
        if (!hasFocus) w8,
        if (!hasFocus)
          SizedBox(
            height: 38,
            width: 100,
            child: FilledButton(
              onTap: () {},
              text: Strings.request,
            ),
          ),
      ],
    );
  }

  Widget _sendMessageButton() {
    return ValueListenableBuilder(
      valueListenable: tcMessage,
      builder: (context, value, child) {
        return SizedBox(
          width: 41,
          height: 41,
          child: GestureDetector(
            onTap: sendMessage,
            child: CircleAvatar(
              backgroundColor:
                  tcMessage.text.trim().isEmpty ? Colors.grey[400] : Theme.of(context).accentColor,
              child: const Icon(
                Icons.send,
                size: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  void sendMessage() async {
    final message = tcMessage.text.trim();

    if (message.isEmptyORNull) {
      return;
    }

    context.read<ChatCubit>().sendMessage(message);
    tcMessage.clear();
  }
}
