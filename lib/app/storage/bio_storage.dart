import 'package:biometric_storage/biometric_storage.dart';
import 'package:injectable/injectable.dart';

import '../app.dart';

/// USED FOR RETRIEVING AND SETTING VALUES FROM BIO METRIC STORAGE

@singleton
class BioStorage {
  Future<BiometricStorageFile> getStorageFile(String fileName) async =>
      await BiometricStorage().getStorage(fileName);

  /// Returns whether this device supports biometric/secure storage or
  /// the reason [CanAuthenticateResponse] why it is not supported.
  Future<bool> canAuthenticate() async {
    final canAuthenticate = await BiometricStorage().canAuthenticate();

    switch (canAuthenticate) {
      case CanAuthenticateResponse.success:
        return true;
      case CanAuthenticateResponse.errorHwUnavailable:
        // TODO: Handle this case.
        break;
      case CanAuthenticateResponse.errorNoBiometricEnrolled:
        showErrorDialog(
          title: Strings.authenticationFailed,
          description: Strings.errorMsgAuthFailed,
        );
        break;
      case CanAuthenticateResponse.errorNoHardware:
        showErrorDialog(
          title: Strings.authenticationFailed,
          description: Strings.errorMsgAuthFailed,
        );
        break;
      case CanAuthenticateResponse.statusUnknown:
        // TODO: Handle this case.
        break;
      case CanAuthenticateResponse.unsupported:
        // TODO: Handle this case.
        break;
    }

    return false;
  }

  /// Returns VALUE :- ONLY IF READ GETS SUCCESS FROM STORAGE (null is also a value)
  /// Failed otherwise and handles error with appropriate message and reason of failure.
  Future<String?> readValue(String fileName) async {
    try {
      final safeStorageFile = await getStorageFile(fileName);
      return await safeStorageFile.read();
    } on AuthException catch (e, stackTrace) {
      switch (e.code) {
        case AuthExceptionCode.userCanceled:
          break;
        case AuthExceptionCode.canceled:
          break;
        case AuthExceptionCode.unknown:
          break;
        case AuthExceptionCode.timeout:
          break;
        case AuthExceptionCode.linuxAppArmorDenied:
          break;
      }

      showLog("readValue exception =====>>> $e");
      showLog("readValue stackTrace =====>>> $stackTrace");
    }
    return Keys.authFailed;
  }

  /// Returns TRUE :- ONLY IF WRITE GETS SUCCESS ON STORAGE
  /// FALSE otherwise and handles error with appropriate message and reason of failure.
  Future<bool> writeValue(String fileName, String content) async {
    try {
      final safeStorageFile = await getStorageFile(fileName);
      await safeStorageFile.write(content);
      return true;
    } on AuthException catch (e, stackTrace) {
      switch (e.code) {
        case AuthExceptionCode.userCanceled:
          break;
        case AuthExceptionCode.canceled:
          break;
        case AuthExceptionCode.unknown:
          break;
        case AuthExceptionCode.timeout:
          break;
        case AuthExceptionCode.linuxAppArmorDenied:
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
  Future<bool> savePrivateKey(String privateKey) async {
    final response = await canAuthenticate();

    if (response) {
      final result = await writeValue(Keys.privateKey, privateKey);
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
  Future<String?> readPrivateKey() async {
    final response = await canAuthenticate();

    if (response) {
      final result = await readValue(Keys.privateKey);
      return result;
    }
    return Keys.authFailed;
  }

  Future<String?> deletePrivateKey() async {
    final response = await canAuthenticate();

    if (response) {
      final safeStorageFile = await getStorageFile(Keys.privateKey);
      await safeStorageFile.delete();
      return Keys.authSuccess;
    }
    return Keys.authFailed;
  }
}
