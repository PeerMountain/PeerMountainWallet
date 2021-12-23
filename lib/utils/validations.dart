import "dart:convert";
import "dart:typed_data";

import "package:convert/convert.dart" show hex;
import "package:pointycastle/digests/sha3.dart";
import 'package:web3dart/crypto.dart';

final validator = Validator.instance;

class Validator {
  Validator._();

  static Validator get instance => Validator._();

  final emailRegex = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
  final notName = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
  final alpha = RegExp(r"^[A-Za-z ]+$");
  final numeric = RegExp(r"^[0-9]+$");
  final alphanumeric = RegExp(r'^[a-zA-Z0-9 ]$');
  final alphanumericAddress = RegExp(r'^(?!\s*$)[a-zA-Z0-9- ]+$');

  static bool validateText(String name, {int? length}) {
    if (name == '') {
      return false;
    }

    if (length != null) {
      return name.length < length;
    } else {
      return true;
    }
  }

  bool isValidName(String name) {
    Pattern pattern = r'^[a-zA-Z][a-zA-Z\- ]*[a-zA-Z ]$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(name);
  }

  bool isValidEmail(String email) => emailRegex.hasMatch(email);

  bool isValidNumber(String number) => numeric.hasMatch(number);

  bool isValidEthFormat(String address) {
    return RegExp(r"^[0-9a-fA-F]{40}$").hasMatch(strip0x(address));
  }

  /// Derives an Ethereum address from a given public key.
  String ethereumAddressFromPublicKey(Uint8List publicKey) {
    final decompressedPubKey = decompressPublicKey(publicKey);
    final hash = SHA3Digest(256).process(decompressedPubKey.sublist(1));
    final address = hash.sublist(12, 32);

    return checksumEthereumAddress(hex.encode(address));
  }

  /// Converts an Ethereum address to a check-summed address (EIP-55).
  String checksumEthereumAddress(String address) {
    if (!isValidEthFormat(address)) {
      throw ArgumentError.value(address, "address", "invalid address");
    }

    final addr = strip0x(address).toLowerCase();
    final hash = ascii.encode(hex.encode(
      SHA3Digest(256).process(ascii.encode(addr)),
    ));

    var newAddr = "0x";

    for (var i = 0; i < addr.length; i++) {
      if (hash[i] >= 56) {
        newAddr += addr[i].toUpperCase();
      } else {
        newAddr += addr[i];
      }
    }

    return newAddr;
  }

  /// Returns whether a given Ethereum address is valid.
  bool isValidEthereumAddress(String address) {
    if (!isValidEthFormat(address)) {
      return false;
    }

    final addr = strip0x(address);
    // if all lowercase or all uppercase, as in checksum is not present
    if (RegExp(r"^[0-9a-f]{40}$").hasMatch(addr) || RegExp(r"^[0-9A-F]{40}$").hasMatch(addr)) {
      return true;
    }

    String checksumAddress;
    try {
      checksumAddress = checksumEthereumAddress(address);
    } catch (err) {
      return false;
    }

    return addr == checksumAddress.substring(2);
  }
}
