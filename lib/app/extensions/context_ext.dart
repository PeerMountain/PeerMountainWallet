import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';

export 'package:velocity_x/velocity_x.dart';

extension ContextExt on BuildContext {
  /// Light theme = *[Palette.black]
  /// Dark theme = *[Palette.white]
  Color get textColor => Theme.of(this).textTheme.bodyText2!.color!;

  /// Light theme = *[Palette.black]
  /// Dark theme = *[Palette.black]
  Color get textBlack => brightness == Brightness.light ? Colors.black : Colors.black;

  /// Light theme = *[Palette.grey]
  /// Dark theme = *[Colors.grey[400]]
  Color get subtitleColor => Theme.of(this).colorScheme.secondaryVariant;

  /// Light theme = *[Palette.lightBorderColor]
  /// Dark theme = *[Palette.darkBorderColor]
  Color get borderColor =>
      brightness == Brightness.light ? Palette.lightBorderColor : Palette.darkBorderColor;

  /// Light theme = *[Palette.accentLight]
  /// Dark theme = *[Palette.black]
  Color? get homeBackgroundColor => Theme.of(this).bottomNavigationBarTheme.backgroundColor;

  /// Light theme = *[Colors.white]
  /// Dark theme = *[Colors.grey[800]]
  Color? get bottomBarColor => Theme.of(this).bottomNavigationBarTheme.selectedItemColor;
}
