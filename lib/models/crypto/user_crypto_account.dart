import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class CryptoAccount extends Equatable {
  /// ACCOUNT'S PRIVATE-KEY
  final String? privateKey;
  final Uint8List? encodedPrivateKey;

  /// public encryption key
  final String? publicKey;
  final Uint8List? encodedPublicKey;

  /// public address like 0xABCDE
  final String? address;
  final Uint8List? encodedAddress;

  final String? mnemonics;
  final List<String>? mnemonicsList;

  const CryptoAccount({
    required this.address,
    required this.encodedPublicKey,
    required this.encodedPrivateKey,
    this.publicKey,
    this.privateKey,
    this.encodedAddress,
    this.mnemonics,
    this.mnemonicsList,
  });

  CryptoAccount copyWith({
    String? privateKey,
    Uint8List? encodedPrivateKey,
    String? publicKey,
    Uint8List? encodedPublicKey,
    String? address,
    Uint8List? encodedAddress,
    String? mnemonics,
    List<String>? mnemonicsList,
  }) {
    return CryptoAccount(
      privateKey: privateKey ?? this.privateKey,
      encodedPrivateKey: encodedPrivateKey ?? this.encodedPrivateKey,
      publicKey: publicKey ?? this.publicKey,
      encodedPublicKey: encodedPrivateKey ?? this.encodedPublicKey,
      address: address ?? this.address,
      encodedAddress: encodedAddress ?? this.encodedAddress,
      mnemonics: mnemonics ?? this.mnemonics,
      mnemonicsList: mnemonicsList ?? this.mnemonicsList,
    );
  }

  @override
  String toString() =>
      "privateKey : $privateKey, encodedPrivateKey : $encodedPrivateKey,\npublicKey : $publicKey, "
      "encodedPublicKey : $encodedPublicKey,\naddress : $address, encodedAddress : $encodedAddress,\n"
      "mnemonics : $mnemonics, mnemonicsList : $mnemonicsList";

  @override
  bool? get stringify => false;

  @override
  List<Object?> get props => [encodedPublicKey];
}
