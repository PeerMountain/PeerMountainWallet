import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this.currentMode) : super(currentMode);
  ThemeMode currentMode = ThemeMode.light;

  void changeTheme(ThemeMode mode) {
    if (mode == currentMode) {
      return;
    }
    prefs.setTheme(mode.toString().split(".")[1]);
    currentMode = mode;
    emit(currentMode);
  }

  void toggle() {
    if (currentMode == ThemeMode.light) {
      toDark();
    } else {
      toLight();
    }
  }

  void toLight() => changeTheme(ThemeMode.light);

  void toDark() => changeTheme(ThemeMode.dark);
}
