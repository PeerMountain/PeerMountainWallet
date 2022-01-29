import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorage {
  static const kycPrivateKey = 'kycPrivateKey';
  static const kycUserPin = 'kycUserPin';

  final secureStorage = const FlutterSecureStorage();

  Future<dynamic> readPin() async {
    return await secureStorage.read(key: kycUserPin);
  }

  Future<void> savePin(String pin) async {
    return await secureStorage.write(key: kycUserPin, value: pin);
  }

  Future<dynamic> readPrivateKey() async {
    return await secureStorage.read(key: kycPrivateKey);
  }

  Future<void> savePrivateKey(String privateKey) async {
    return await secureStorage.write(key: kycPrivateKey, value: privateKey);
  }

  Future<void> deletePrivateKey() async {
    return await secureStorage.delete(key: kycPrivateKey);
  }
}
