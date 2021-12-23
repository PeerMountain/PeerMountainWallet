import 'dart:convert';

import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/message.pb.dart';
import 'package:kyc3/generated/google/protobuf/any.pb.dart';
import 'package:kyc3/models/models.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

class XmppUtils {
  /// ACTUAL MAIN PORT TO BE CONNECTED FOR KYC
  static const port = 443;

  /// ANONYMOUS HOST
  static const anonymousHost = 'xmpp-anon.kyc3.com';
  static const anonUserAtServer = '@$anonymousHost';

  /// ACTUAL MAIN KYC XMPP HOST
  static const host = 'xmpp.kyc3.com';

  /// oracle address
  // static String oracleAddress = '0x24eb69030be50c01f3952fed03bbd36c33e25429';
  // static String oracleAddress = '0xd084ed39243077b24a7fa6522b8795fef35e92df';
  static String oracleAddress = '0xe85eaddac40e3eca56e7243921c73ceb27a5f1fa';

  static xmpp.Jid get oracleJID => xmpp.Jid.fromFullJid("${XmppUtils.oracleAddress}@${XmppUtils.host}");

  /// This method will take *[from] address and *[generalMessage]
  /// from which message has been sent and
  ///
  /// WILL VERIFY THAT WHETHER MESSAGE HAS BEEN SENT FROM ACTUAL KYC3 SERVER OR NOT.
  ///
  /// If yes then *[ParsedMessage.status] will be returned true otherwise false.
  static ParsedMessage parseAndVerifyMessage({
    required String from,
    required GeneralMessage generalMessage,
  }) {
    final decrypted = web3Service.decryptMessage(
      cipherText: generalMessage.message.cipherText,
      nonce: generalMessage.message.nonce,
      ephemPublicKey: generalMessage.message.ephemPublicKey,

      /// current user's privateKey INTS
      secretKey: cryptoAccount.encodedPrivateKey!,
    );

    if (decrypted != null) {
      final signedMessage = SignedMessage.fromBuffer(base64Decode(decrypted));
      final isValid = web3Service.verifyServerSignature(from, signedMessage);

      if (isValid) {
        return ParsedMessage(isValid: true, message: signedMessage.addressed.message);
      }
    } else {
      showLog("decrypted message is returned null.");
    }

    return const ParsedMessage(isValid: false, error: "USER NOT VERIFIED!");
  }

  static Future<String?> signEncryptAndSendMessageToAnonymous(Any packed) async {
    final encoded = base64Encode(packed.writeToBuffer());
    final signature = await web3Service.signPersonalMessage(payload: encoded);
    final signedAnon = SignedAnonymousMessage(
      signature: signature![Keys.signature],
      address: cryptoAccount.address!,
      publicKey: cryptoAccount.publicKey!,
      message: packed,
    );

    SignedMessage signed = SignedMessage(anonymous: signedAnon);

    final encodedSigned = base64Encode(signed.writeToBuffer());
    final encrypted = web3Service.encryptMessage(
      message: encodedSigned,

      /// oracle address *[serverAccount]'s publicEncodedEncryptionKey
      receiverPublicKey: serverAccount.publicEncryptionKey,
    );

    if (encrypted != null) {
      final encryptedMessage = EncryptedMessage(
        version: encrypted.version,
        nonce: encrypted.nonce,
        ephemPublicKey: encrypted.ephemPublicKey,
        cipherText: encrypted.cipherText,
      );

      final generalMessage = GeneralMessage(message: encryptedMessage);
      final byteArray = generalMessage.writeToBuffer();
      final base64Request = base64Encode(byteArray);
      return base64Request;
    } else {
      /// handle error
    }
  }

  static Future<String?> signEncryptAndSendMessageToNormal(Any packed) async {
    final encoded = base64Encode(packed.writeToBuffer());
    final signature = await web3Service.signPersonalMessage(payload: encoded);
    final signedAdd = SignedAddressedMessage(
      signature: signature![Keys.signature],
      publicKey: cryptoAccount.publicKey!,
      message: packed,
    );

    SignedMessage signed = SignedMessage(addressed: signedAdd);

    final encodedSigned = base64Encode(signed.writeToBuffer());
    final encrypted = web3Service.encryptMessage(
      message: encodedSigned,

      /// oracle address *[serverAccount]'s publicEncodedEncryptionKey
      receiverPublicKey: serverAccount.publicEncryptionKey,
    );

    if (encrypted != null) {
      final encryptedMessage = EncryptedMessage(
        version: encrypted.version,
        nonce: encrypted.nonce,
        ephemPublicKey: encrypted.ephemPublicKey,
        cipherText: encrypted.cipherText,
      );

      final generalMessage = GeneralMessage(message: encryptedMessage);
      final byteArray = generalMessage.writeToBuffer();
      final base64Request = base64Encode(byteArray);
      return base64Request;
    } else {
      /// handle error
    }
  }
}
