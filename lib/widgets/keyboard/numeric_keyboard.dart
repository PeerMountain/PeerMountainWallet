import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';

import '../widgets.dart';

typedef KeyboardTapCallback = void Function(String? text);

class NumericKeyboard extends StatelessWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Widget? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Widget? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  final bool? showDot;

  final VoidCallback? onDoneTap;

  final IconData? doneIcon;

  const NumericKeyboard({
    Key? key,
    required this.onKeyboardTap,
    this.textColor = Colors.black,
    this.rightButtonFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.showDot = true,
    this.onDoneTap,
    this.doneIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton(context, '1'),
              _calcButton(context, '2'),
              _calcButton(context, '3'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton(context, '4'),
              _calcButton(context, '5'),
              _calcButton(context, '6'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton(context, '7'),
              _calcButton(context, '8'),
              _calcButton(context, '9'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              _deleteButton(context),
              _calcButton(context, '0'),
              if (onDoneTap != null) _doneButton(context) else _calcButton(context, showDot! ? '.' : ""),
            ],
          ),
        ),
      ],
    );
  }

  Widget _deleteButton(BuildContext context) {
    return Expanded(
      child: SizedBox.expand(
        child: MaterialButton(
          onPressed: () => onKeyboardTap(null),
          child: Icon(
            Icons.backspace,
            color: context.textColor,
          ),
        ),
      ),
    );
  }

  Widget _doneButton(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onDoneTap,
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: context.primaryColor,
              child: Icon(
                doneIcon ?? Icons.done,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _calcButton(BuildContext context, String value) {
    return Expanded(
      child: SizedBox.expand(
        child: MaterialButton(
          onPressed: value.isEmpty
              ? null
              : () {
                  onKeyboardTap(value);
                },
          child: Center(
            child: Texts(
              value,
              style: context.textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
