import 'package:biometric_storage/biometric_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../app.dart';

/// USED FOR RETRIEVING AND SETTING VALUES FROM BIO METRIC STORAGE

@singleton
class BioStorage {
  Future<BiometricStorageFile> getStorageFile(String fileName, {String? title, String? cancelText}) async {
    PromptInfo promptInfo = PromptInfo.defaultValues;
    const defaultTitle = Strings.defaultAuthTitle;
    const defaultCancelText = Strings.cancel;

    promptInfo = PromptInfo(
      androidPromptInfo: AndroidPromptInfo(
        title: title ?? defaultTitle,
        negativeButton: cancelText ?? defaultCancelText,
      ),
      iosPromptInfo: IosPromptInfo(
        accessTitle: title ?? defaultTitle,
      ),
    );

    return await BiometricStorage().getStorage(fileName, promptInfo: promptInfo);
  }

  /// Returns whether this device supports biometric/secure storage or
  /// the reason [CanAuthenticateResponse] why it is not supported.
  Future<bool> canAuthenticate({
    VoidCallback? errorHwUnavailable,
    VoidCallback? errorNoBiometricEnrolled,
    VoidCallback? errorNoHardware,
    VoidCallback? statusUnknown,
  }) async {
    final canAuthenticate = await BiometricStorage().canAuthenticate();

    switch (canAuthenticate) {
      case CanAuthenticateResponse.success:
        return true;
      case CanAuthenticateResponse.errorHwUnavailable:
        errorHwUnavailable?.call();
        break;
      case CanAuthenticateResponse.errorNoBiometricEnrolled:
        errorNoBiometricEnrolled?.call();
        break;
      case CanAuthenticateResponse.errorNoHardware:
        errorNoHardware?.call();
        break;
      case CanAuthenticateResponse.statusUnknown:
        statusUnknown?.call();
        break;
      case CanAuthenticateResponse.unsupported:
        // TODO: Handle this case.
        break;
    }

    return false;
  }

  /// Returns VALUE :- ONLY IF READ GETS SUCCESS FROM STORAGE (null is also a value)
  /// Failed otherwise and handles error with appropriate message and reason of failure.
  Future<String?> readValue(String fileName,
      {String? title, String? cancelText, VoidCallback? onUsePin}) async {
    try {
      final safeStorageFile = await getStorageFile(fileName, title: title, cancelText: cancelText);
      return await safeStorageFile.read();
    } on AuthException catch (e, stackTrace) {
      switch (e.code) {
        case AuthExceptionCode.userCanceled:
          onUsePin?.call();
          break;
        case AuthExceptionCode.canceled:
          onUsePin?.call();
          break;
        case AuthExceptionCode.unknown:
          onUsePin?.call();
          break;
        case AuthExceptionCode.timeout:
          onUsePin?.call();
          break;
        case AuthExceptionCode.linuxAppArmorDenied:
          onUsePin?.call();
          break;
      }

      showLog("readValue exception =====>>> $e");
      showLog("readValue stackTrace =====>>> $stackTrace");
    }
    return Keys.authFailed;
  }

  /// Returns TRUE :- ONLY IF WRITE GETS SUCCESS ON STORAGE
  /// FALSE otherwise and handles error with appropriate message and reason of failure.
  Future<bool> writeValue(
    String fileName,
    String content, {
    String? title,
    String? cancelText,
    VoidCallback? onUsePin,
  }) async {
    try {
      final safeStorageFile = await getStorageFile(fileName, title: title, cancelText: cancelText);
      await safeStorageFile.write(content);
      return true;
    } on AuthException catch (e, stackTrace) {
      switch (e.code) {
        case AuthExceptionCode.userCanceled:
          onUsePin?.call();
          break;
        case AuthExceptionCode.canceled:
          onUsePin?.call();
          break;
        case AuthExceptionCode.unknown:
          onUsePin?.call();
          break;
        case AuthExceptionCode.timeout:
          onUsePin?.call();
          break;
        case AuthExceptionCode.linuxAppArmorDenied:
          onUsePin?.call();
          break;
      }

      showLog("writeValue exception =====>>> $e");
      showLog("writeValue stackTrace =====>>> $stackTrace");
    }

    return false;
  }

  /// This method will users provided *[Keys.privateKey] in secure storage.
  ///
  /// Now on every read/write of this *[Keys.privateKey] file,
  /// User MUST have to AUTHENTICATE him/her self first via biometrics or pin passcode.
  ///
  /// Otherwise it will always return an ERROR if he/she is NOT ABLE to do so...
  Future<bool> savePrivateKey(
    String privateKey, {
    String? title,
    String? cancelText,
    VoidCallback? onUsePin,
    VoidCallback? errorHwUnavailable,
    VoidCallback? errorNoHardware,
    VoidCallback? statusUnknown,
    VoidCallback? errorNoBiometricEnrolled,
  }) async {
    final response = await canAuthenticate(
      errorHwUnavailable: errorHwUnavailable,
      errorNoHardware: errorNoHardware,
      statusUnknown: statusUnknown,
      errorNoBiometricEnrolled: errorNoBiometricEnrolled,
    );

    if (response) {
      final result = await writeValue(
        Keys.privateKey,
        privateKey,
        title: title,
        cancelText: cancelText,
        onUsePin: onUsePin,
      );
      return result;
    }
    return false;
  }

  /// Reads users *[Keys.privateKey] from secure storage
  /// Only after successful biometric authentication
  ///
  /// NULL is allowed and will be treated as VALUE as well.
  ///
  /// Failed will return *[Keys.authFailed] status.
  Future<String?> readPrivateKey({
    String? title,
    String? cancelText,
    VoidCallback? onUsePin,
    VoidCallback? errorHwUnavailable,
    VoidCallback? errorNoHardware,
    VoidCallback? statusUnknown,
    VoidCallback? errorNoBiometricEnrolled,
  }) async {
    final response = await canAuthenticate(
      errorHwUnavailable: errorHwUnavailable,
      errorNoHardware: errorNoHardware,
      statusUnknown: statusUnknown,
      errorNoBiometricEnrolled: errorNoBiometricEnrolled,
    );

    if (response) {
      final result = await readValue(
        Keys.privateKey,
        title: title,
        cancelText: cancelText,
        onUsePin: onUsePin,
      );
      return result;
    }
    return Keys.authFailed;
  }

  Future<String?> deletePrivateKey({String? title, String? cancelText, VoidCallback? onUsePin}) async {
    final response = await canAuthenticate(
      errorHwUnavailable: onUsePin,
      errorNoHardware: onUsePin,
      statusUnknown: onUsePin,
      errorNoBiometricEnrolled: onUsePin,
    );

    if (response) {
      final safeStorageFile = await getStorageFile(Keys.privateKey, title: title, cancelText: cancelText);
      await safeStorageFile.delete();
      return Keys.authSuccess;
    }
    return Keys.authFailed;
  }
}
