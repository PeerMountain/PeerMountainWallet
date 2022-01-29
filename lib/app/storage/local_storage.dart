import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// USED FOR STORING KEYS INTO
/// LOCAL OR BIO METRIC STORAGE
class Keys {
  /// --------- USED ONLY FOR ----------
  /// LOCAL SHARED PREFERENCES STORAGE

  static const authToken = "authToken";
  static const systemVersion = "systemVersion";
  static const theme = "theme";

  static const showIntros = 'showIntros';
  static const allDone = 'allDone';
  static const userData = 'userData';

  static const authType = 'authType';
  static const both = 'both';
  static const bio = 'bio';
  static const pin = 'pin';

  /// --------- USED ONLY FOR ----------
  /// SAFE BIO METRIC STORAGE

  static const authSuccess = 'auth_success';
  static const authFailed = 'auth_failed';

  /// key to get/set secure storage file
  static const privateKey = 'privateKey';

  static const messageHash = 'messageHash';
  static const signature = 'signature';
  static const publicKey = 'publicKey';

  static const success = 'success';
  static const failed = 'failed';

  static const chat = 'chat';
}

/// USED FOR RETRIEVING AND SETTING LOCAL VALUES
@singleton
class Prefs {
  static late SharedPreferences sharedPref;

  static const light = "light";
  static const dark = "dark";

  static const android = "android";
  static const ios = "ios";

  /// initialize shared prefs
  static Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  /// By default always show intros if user does not complete on-boarding flow
  bool getIntros() => sharedPref.getBool(Keys.showIntros) ?? true;

  Future<bool> setIntros(bool value) => sharedPref.setBool(Keys.showIntros, value);

  /// Theme Utils

  bool isDark() => sharedPref.getString(Keys.theme) == dark;

  /// Defaults to light
  String getTheme() => sharedPref.getString(Keys.theme) ?? light;

  Future<bool> setTheme(String themeType) => sharedPref.setString(Keys.theme, themeType);

  ThemeMode getThemeMode() => getTheme() == light ? ThemeMode.light : ThemeMode.dark;

  Future<void> clearPrefsExceptValues() async {
    final Set set = {};

    sharedPref.getKeys().toList().forEach((key) async {
      if (!set.contains(key)) await sharedPref.remove(key);
    });
  }

  /// Defaults to false
  bool getAllDone() => sharedPref.getBool(Keys.allDone) ?? false;

  Future<bool> setAllDone(bool value) => sharedPref.setBool(Keys.allDone, value);

  String? getSystemVersion() => sharedPref.getString(Keys.systemVersion);

  Future<bool> setSystemVersion(String systemVersion) =>
      sharedPref.setString(Keys.systemVersion, systemVersion);

  String getDeviceType() => Platform.operatingSystem;

  String? getAuthType() => sharedPref.getString(Keys.authType);

  Future<bool> setAuthType(String authType) => sharedPref.setString(Keys.authType, authType);
}
