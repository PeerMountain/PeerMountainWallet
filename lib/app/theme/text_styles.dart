import 'package:flutter/material.dart';
import 'package:kyc3/widgets/text_widget.dart';

class CustomStyles {
  static TextStyle get appbarTitle => Texts.customTextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );

  static BorderRadius get b12 => BorderRadius.circular(12);

  static BorderRadius get b25 => BorderRadius.circular(25);

  static BorderRadius get b50 => b25 * 2;
}
