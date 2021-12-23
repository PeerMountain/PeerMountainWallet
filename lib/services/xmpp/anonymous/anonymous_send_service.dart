import 'dart:convert';

import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/exchange.pb.dart';
import 'package:kyc3/generated/com/kyc3/message.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/login-challenge.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/register.pb.dart';
import 'package:kyc3/generated/google/protobuf/any.pb.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/services/xmpp/src/xmpp_core.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

/// All of the messages SENT through *[AnonymousSendService]
/// has been handled in this class.

class AnonymousSendService {
  final xmpp.Connection connection;
  final xmpp.Jid userJID;
  final xmpp.MessageHandler messageHandler;

  AnonymousSendService({
    required this.connection,
    required this.userJID,
    required this.messageHandler,
  });

  Future<void> closeXmpp() async {
    connection.close();
  }

  void sendMessage(String? base64Request) {
    if (base64Request != null) {
      messageHandler.sendMessage(userJID, base64Request);
    }
  }

  /// Step 1
  ///
  /// Send this request to anonymous server and server will
  /// respond back with *[ExchangeKeysResponse] in
  /// *[anonymousReceiveService.handleExchangeKeyResponse]

  void sendExchangeKeyRequest() async {
    final exchangeKeyRequest = ExchangeKeysRequest(
      username: '',
      address: cryptoAccount.address!,
      publicKey: cryptoAccount.publicKey,
      publicEncryptionKey: cryptoAccount.publicKey,
    );

    final generalMessage = GeneralMessage(exchange: exchangeKeyRequest);

    final byteArray = generalMessage.writeToBuffer();
    final base64Request = base64Encode(byteArray);
    sendMessage(base64Request);
  }

  /// Step 2
  ///
  /// Now send this request to server for user login
  ///
  /// 1. If *[LoginChallengeResponse.registered] is TRUE
  ///
  /// It means user is already registered on our kyc server so no need to him/her signup again.
  /// Instead use *[LoginChallengeResponse.address] as username and
  /// *[LoginChallengeResponse.challenge] as password for *[NormalXmppService] method.
  /// See *[_handleLoginChallengeResponse2] for more info.
  ///
  /// Which will login user into app and now will use Authenticated channel for every
  /// request sent over server instead of Anonymous channel.
  ///
  /// 2. If *[LoginChallengeResponse.registered] is FALSE
  ///
  /// It means we need to follow register flow for user registration process.
  /// See *[sendInitiateUserXMPPRegistrationRequest] for more info.

  void sendLoginChallengeRequest({
    required String userAddress,
    required String userPublicKey,
    required String privateKey,
  }) async {
    final packed = Any.pack(LoginChallengeRequest(address: userAddress));

    final base64Request = await XmppUtils.signEncryptAndSendMessageToAnonymous(packed);
    sendMessage(base64Request);
  }

  /// Step 3
  ///
  /// Send this request when we need to first signup user on kyc server.
  ///
  /// Server will respond back with *[InitiateUserXMPPRegistrationResponse].
  /// Now once response received from server call *[_handleInitiateUserXMPPRegistrationResponse] for
  /// user signup.

  void sendInitiateUserXMPPRegistrationRequest({
    required String userAddress,
    required String userPublicKey,
    required String privateKey,
  }) async {
    final packed = Any.pack(InitiateUserXMPPRegistrationRequest(address: userAddress));
    final base64Request = await XmppUtils.signEncryptAndSendMessageToAnonymous(packed);
    sendMessage(base64Request);
  }

  /// Step 3.1
  ///
  /// This will signup user on kyc server and then server will
  /// respond back with *[RegisterUserResponse].
  ///
  /// Now once response received call *[sendLoginChallengeRequest]
  /// so that user can login into app and completes his/her registration process.
  void sendRegisterUserRequest({
    required String userAddress,
    required String challenge,
  }) async {
    /// Challenge received from server should be signedChallenge
    final signedChallenge = await web3Service.signPersonalMessage(payload: challenge);

    final packed = Any.pack(
      RegisterUserRequest(address: userAddress, signedChallenge: signedChallenge![Keys.signature]),
    );
    final base64Request = await XmppUtils.signEncryptAndSendMessageToAnonymous(packed);
    sendMessage(base64Request);
  }
}
