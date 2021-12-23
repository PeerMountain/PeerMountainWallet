import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';

import '../widgets.dart';

typedef KeyboardTapCallback = void Function(String? text);

class NumericKeyboard extends StatefulWidget {
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

  const NumericKeyboard({
    Key? key,
    required this.onKeyboardTap,
    this.textColor = Colors.black,
    this.rightButtonFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('.'),
              _calcButton('0'),
              _deleteButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _deleteButton() {
    return Expanded(
      child: InkWell(
        // borderRadius: BorderRadius.circular(50),
        onTap: () {
          widget.onKeyboardTap(null);
        },
        child: FittedBox(
          child: SizedBox(
            width: 80,
            height: 80,
            child: Icon(
              Icons.backspace_outlined,
              color: context.textColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _calcButton(String value) {
    return Expanded(
      child: InkWell(
        // borderRadius: BorderRadius.circular(80),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: FittedBox(
          child: SizedBox(
            width: 80,
            height: 80,
            child: Center(
              child: Texts(
                value,
                fontSize: 26,
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
