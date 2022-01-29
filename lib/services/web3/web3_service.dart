import 'dart:convert';

import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter_sodium/flutter_sodium.dart' as s;
import 'package:injectable/injectable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/message.pbserver.dart' as m;
import 'package:kyc3/models/crypto/user_crypto_account.dart';
import 'package:kyc3/models/models.dart';
import 'package:kyc3/services/services.dart';
import 'package:pinenacl/api.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

export 'web3_utils.dart';

typedef Crypting = Uint8List Function(
    Uint8List out, Uint8List text, int textLen, Uint8List nonce, Uint8List k);

/// Only used for all of the web3 services and methods
/// please check *[Web3Repository] for all of the kyc requests and responses.

@singleton
class Web3DartService {
  static const _messagePrefix = '\u0019Ethereum Signed Message:\n';

  Future<DMap?> signPersonalMessage({required dynamic payload}) async {
    try {
      dynamic messageHash;
      if (payload is String) {
        /// for hex strings
        if (payload.startsWith("0x")) {
          messageHash = keccak256(hexToBytes(payload)).toUint8List();
        } else {
          /// for normal strings
          messageHash = keccak256(utf8.encode(payload).toUint8List()).toUint8List();
        }
      } else {
        messageHash = keccak256(payload).toUint8List();
      }

      /// This will sign personal message for eth_account
      final signPersonalMessage = await web3Repository.credentials.signPersonalMessage(messageHash);
      final address = bytesToHex(signPersonalMessage, include0x: true);

      final returnedMap = {
        Keys.signature: address,
        Keys.messageHash: messageHash,
        Keys.publicKey: web3Repository.credentials.encodedPublicKey,
      };
      return returnedMap;
    } catch (e, stackTrace) {
      showLog("signPersonalMessage exception =====>>> $e");
      showLog("signPersonalMessage exception stackTrace =====>>> $stackTrace");
    }
  }

  /// This is to verify signed signature
  bool verifySignature(
    Uint8List messageHash,
    MsgSignature signature,
    Uint8List publicKeyAddress,
  ) {
    return isValidSignature(
      messageHash,
      signature,
      publicKeyAddress,
    );
  }

  /// SENDER WILL CALL THIS FUNCTION TO ENCRYPT MESSAGE
  ///
  /// receiversPublicKey : An base64Encoded string value of RECEIVER'S PUBLIC KEY
  /// message : An Actual message/data to be sent to RECEIVER
  ///
  /// Every call of thiS function will generate A UNIQUE RANDOM VALUES
  ///
  /// A UNIQUE RANDOM VALUES FOR DATA SECURITY AND ENHANCEMENT WHICH WILL
  /// HELP US TO REDUCE DATA BEING EXPOSED WHEN CLIENT/SERVER EXCHANGE MESSAGES
  /// OVER XMPP CLIENT SERVER CONNECTION

  m.EncryptedMessage? encryptMessage({
    required String receiverPublicKey,
    required String message,
  }) {
    try {
      /// convert string into int array
      final pubKeyUInt8Array = base64.decode(receiverPublicKey);

      /// get random crypto box key pair
      final ephemPublicKey = s.Sodium.cryptoBoxKeypair();

      /// get random nonce
      final nonce = s.SecretBox.randomNonce();

      /// get unique cipherText everytime
      final cipherText = s.Sodium.cryptoBoxEasy(
        message.toIntArray(),
        nonce,
        pubKeyUInt8Array,
        ephemPublicKey.sk,
      );

      return m.EncryptedMessage(
        version: 'x25519-xsalsa20-poly1305',
        nonce: base64Encode(nonce),
        ephemPublicKey: base64Encode(ephemPublicKey.pk),
        cipherText: base64Encode(cipherText),
      );
    } catch (e, stackTrace) {
      showLog("encryptMessage exception =====>>> $e");
      showLog("encryptMessage exception stackTrace =====>>> $stackTrace");
    }
  }

  /// RECEIVER WILL CALL THIS METHOD TO DECRYPT THE MESSAGE
  ///
  /// cipherText : A unique cipherText sent from sender via request
  /// nonce : A unique none sent from sender via request
  /// ephemPublicKey : A unique key sent from sender via request
  /// secretKey : A unique secretKey/privateKey INT_ARRAY of the CURRENT_USER i.e RECEIVER (IMP)
  ///
  /// THIS WILL RETURN AN ACTUAL MESSAGE SENT BY SENDER TO HIM/HER

  String? decryptMessage({
    required String cipherText,
    required String nonce,
    required String ephemPublicKey,
    required Uint8List secretKey,
  }) {
    try {
      final decrypted = s.Sodium.cryptoBoxOpenEasy(
        base64Decode(cipherText),
        base64Decode(nonce),
        base64Decode(ephemPublicKey),
        secretKey,
      );
      return String.fromCharCodes(decrypted);
    } catch (e, stackTrace) {
      showLog("decryptMessage exception =====>>> $e");
      showLog("decryptMessage exception stackTrace =====>>> $stackTrace");
    }
  }

  /// TO GET CURRENT USER'S CRYPTO ACCOUNT KEYS
  ///
  /// privateKey : A unique string value of users privateKey obtained from any wallet.
  ///
  /// Returns a PRIVATE_KEY INTS AND AN ENCODED PUBLIC KEY STRING
  /// FOR ENCRYPTION & DECRYPTION OF MESSAGES

  CryptoAccount? getUserCryptoAccount(String privateKey) {
    try {
      final credentials = EthPrivateKey.fromHex(privateKey);
      final cryptoPK = PrivateKey(credentials.privateKey);
      final base64EncodedPK = base64Encode(cryptoPK.publicKey);

      return CryptoAccount(
        privateKey: privateKey,
        encodedPrivateKey: credentials.privateKey,
        publicKey: base64EncodedPK,
        encodedPublicKey: cryptoPK.publicKey.toUint8List(),
        address: credentials.address.hex,
        encodedAddress: credentials.address.addressBytes,
      );
    } catch (e, stackTrace) {
      showLog("getUserCryptoKeys exception =====>>> $e");
      showLog("getUserCryptoKeys exception stackTrace =====>>> $stackTrace");
    }
  }

  /// This is to verify server signed messages at app side
  /// We've to verify message sent by server for security purposes and
  /// to reduce spam messages and drop/discard any messages which are
  /// NOT SENT by our kyc3 server.
  ///
  bool verifyServerSignature(String from, m.SignedMessage signedMessage) {
    try {
      final addressed = signedMessage.addressed;

      /// The public address from which this message has been sent
      final sentByPublicAddress = strip0x(from);

      /// Convert message to byteArray from given signed message
      final intArray = addressed.message.writeToBuffer();

      /// Get Hash of converted byteArray and encrypt it using sha3/keccak256 algorithm
      final hash = keccak256(base64Encode(intArray).codeUnits.toUint8List());

      /// Convert byteArray to MsgSignature class which accepts params in
      /// r, s, v standard format
      final signatureData = addressed.signature.toSignature();

      /// Add prefix to message
      final prefix = _messagePrefix + hash.length.toString();

      /// Encode new value and Get byteArray out of it
      final prefixBytes = ascii.encode(prefix);

      /// Again encrypt prefixBytes using sha3/keccak256 algorithm and byteArray of it
      final prefixedHash = keccak256((prefixBytes + hash).toUint8List());

      /// Recover the public key that was used to sign this message and signature.
      final recoveredPublicKeyInts = ecRecover(prefixedHash, signatureData);
      final recoveredPublicAddress = bytesToHex(publicKeyToAddress(recoveredPublicKeyInts));

      /// MUST AND MOST IMPORTANT RETURN TRUE ONLY
      /// IF SIGNED MESSAGE ADDRESS OWNER PUBLIC KEY ADDRESS == RECOVERED PUBLIC KEY ADDRESS
      /// ELSE RETURN FALSE IF IT DOES NOT MATCH
      return sentByPublicAddress == recoveredPublicAddress;
    } catch (e, stackTrace) {
      showLog("verifyServerSignature exception =====>>> $e");
      showLog("verifyServerSignature stackTrace =====>>> $stackTrace");
    }

    return false;
  }

  /// This function will be used to generate random mnemonics phrases
  /// as well as private key associated with it.
  ///
  /// Which will be used only for currently created mnemonics phrases
  /// and user associated with it.
  ///
  /// Take this function as a user-sign-up function for crypto-currency
  /// which signs-up user for CRYPTO ACCOUNT and then he/she can
  /// use this ACCOUNT wherever he/she wants to use and to any wallets.
  ///
  /// THIS IS VERY SENSITIVE INFORMATION FOR EVERY USER'S ACCOUNT

  CryptoAccount? generateMnemonics() {
    try {
      final randomMnemonic = bip39.generateMnemonic(strength: 256);
      final seed = bip39.mnemonicToSeedHex(randomMnemonic);

      bip32.BIP32 node = bip32.BIP32.fromSeed(hexToBytes(seed));

      final privateKey = bytesToHex(node.privateKey!);
      var account = getUserCryptoAccount(privateKey);

      if (account != null) {
        account = account.copyWith(
          mnemonics: randomMnemonic,
          mnemonicsList: randomMnemonic.split(" "),
        );
        return account;
      }
    } catch (e, stackTrace) {
      showLog("generateMnemonics exception =====>>> $e");
      showLog("generateMnemonics exception stackTrace =====>>> $stackTrace");
    }
  }

  /// To import user account from different crypto account provider
  /// we can use this function to get user's crypto account from provided
  /// mnemonics words list. Which will be used only for currently imported
  /// mnemonics phrases and user associated with it.
  ///
  /// THIS IS VERY SENSITIVE INFORMATION FOR EVERY USER'S ACCOUNT

  CryptoAccount? getCryptoAccountFromMnemonics(String mnemonics) {
    final seed = bip39.mnemonicToSeedHex(mnemonics);

    bip32.BIP32 node = bip32.BIP32.fromSeed(hexToBytes(seed));

    final privateKey = bytesToHex(node.privateKey!);
    var account = getUserCryptoAccount(privateKey);

    account = account?.copyWith(
      mnemonics: mnemonics,
      mnemonicsList: mnemonics.split(" "),
    );
    return account;
  }
}
