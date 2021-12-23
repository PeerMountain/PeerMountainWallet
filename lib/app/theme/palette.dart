import 'package:colours/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyc3/widgets/text_widget.dart';

class Palette {
  static const accentColor = Color(0xFF48C4DE);
  static const accentLight = Color(0xFFF0FDFF);
  static const accentLight3 = Color(0xFF83D2DF);
  static const appBarColor = Color(0xFFA7E7F8);
  static const grey = Color(0xFF6C6C6C);
  static final lightGrey = grey.withOpacity(0.4);

  static const lightBorderColor = Color(0xFFf2f2f2);
  static const darkBorderColor = grey;

  static const orange = Color(0xFFff7d24);
  static const red = Colors.red;
  static final error = Colors.red[700];
  static const green = Color(0xFF00B14C);

  static const iconBlack = Color(0xff343A40);

  static const black = Colors.black;
  static const white = Colors.white;
  static const transparent = Colors.transparent;

  static const accentGradient = LinearGradient(
    colors: [
      accentColor,
      accentLight3,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: accentColor,
    primarySwatch: Colours.swatch('#48c4de'),
    backgroundColor: Colors.white,
    // splashColor: accentLight,
    accentColor: accentColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: accentLight,
      selectedItemColor: Colors.white,
      unselectedItemColor: black,
    ),
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: accentColor,
      secondary: accentLight,
      error: Palette.red,
      secondaryVariant: grey,
      surface: lightGrey,
    ),
    textTheme: TextTheme(
      headline3: Texts.customTextStyle(
        color: black,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: Texts.customTextStyle(
        color: black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: Texts.customTextStyle(color: black),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: accentLight,
      selectionColor: accentColor,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: black),
      backgroundColor: appBarColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: accentColor,
    primarySwatch: Colours.swatch('#48c4de'),
    // splashColor: accentLight,
    accentColor: accentColor,
    backgroundColor: black,
    colorScheme: ColorScheme.dark(
      primary: accentColor,
      secondary: accentLight,
      error: Palette.red,
      secondaryVariant: Colors.grey[400]!,
      surface: lightGrey,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: black,
      selectedItemColor: Colors.grey[800]!,
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      headline3: Texts.customTextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: Texts.customTextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: Texts.customTextStyle(color: Colors.white),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: accentLight,
      selectionColor: accentColor,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: appBarColor,
    ),
  );
}
