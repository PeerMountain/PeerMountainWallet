import 'package:flutter/material.dart';
import 'package:kyc3/widgets/widgets.dart';

class CustomKeyboardLayout extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;

  const CustomKeyboardLayout({
    Key? key,
    required this.focusNode,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NumericKeyboard(
      onKeyboardTap: (String? text) {
        final previous = controller.text;
        if (!focusNode.hasFocus) {
          focusNode.requestFocus();
        }
        if (text == null) {
          controller.clear();
          if (previous.isNotEmpty) {
            controller.text = previous.substring(0, previous.length - 1);
          } else {
            controller.clear();
          }
        } else {
          if (previous.contains(".") && text == ".") {
            return;
          }

          controller.text = previous + text;
        }
        final newText = controller.text;
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: newText.length),
        );
      },
    );
  }
}
