import 'package:flutter/material.dart';
import 'package:kyc3/widgets/widgets.dart';

class CustomKeyboardLayout extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) onKeyTap;
  final Function(String)? onDoneTap;
  final VoidCallback? onMaxLengthReached;
  final int? maxLength;
  final bool? showDot;
  final IconData? doneIcon;

  const CustomKeyboardLayout({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.onKeyTap,
    this.onDoneTap,
    this.maxLength,
    this.showDot,
    this.onMaxLengthReached,
    this.doneIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NumericKeyboard(
      showDot: showDot,
      onDoneTap: () => onDoneTap?.call(controller.text),
      doneIcon: doneIcon,
      onKeyboardTap: (String? text) {
        final previous = controller.text;
        if (!focusNode.hasFocus) {
          focusNode.requestFocus();
        }

        /// back button pressed
        if (text == null) {
          controller.clear();
          if (previous.isNotEmpty) {
            controller.text = previous.substring(0, previous.length - 1).trim();
          }
        } else {
          if (maxLength != null && previous.length >= maxLength!) {
            onMaxLengthReached?.call();
            onKeyTap.call(previous);
            return;
          }

          if (previous.contains(".") && text == ".") {
            return;
          }

          controller.text = previous + text;
        }
        final newText = controller.text;
        if (newText.isNotEmpty) {
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: newText.length),
          );
        }
        onKeyTap.call(newText);
      },
    );
  }
}
