import 'dart:convert';
import 'dart:typed_data';

import 'package:kyc3/cubits/balance/balance_cubit.dart';
import 'package:kyc3/generated/com/kyc3/exchange.pb.dart';
import 'package:kyc3/generated/com/kyc3/message.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/payment/payment.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/challenge-signed.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/deposit.pbserver.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/erc20.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/initiate-nft-purchase.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/search-nft.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/user-token.pb.dart';
import 'package:kyc3/generated/google/protobuf/any.pb.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/services/xmpp/src/xmpp_core.dart';
import 'package:kyc3/ui/main_screen/gallery/gallery_cubit.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_cubit.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

/// All of the messages SENT through *[NormalXmppService]
/// has been handled in this class.

class NormalSendService {
  final xmpp.Connection connection;
  final xmpp.Jid userJID;
  final xmpp.MessageHandler messageHandler;

  NormalSendService({
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

  /// Send exchange key request message to server
  void sendExchangeKeyRequest({
    required String username,
    required String address,
    required Uint8List publicKey,
    required String publicEncryptionKey,
  }) async {
    final exchangeKeyRequest = ExchangeKeysRequest(
      username: username,
      address: address,
      publicKey: base64Encode(publicKey),
      publicEncryptionKey: publicEncryptionKey,
    );

    final generalMessage = GeneralMessage(exchange: exchangeKeyRequest);

    final byteArray = generalMessage.writeToBuffer();
    final base64Request = base64Encode(byteArray);

    sendMessage(base64Request);
  }

  /// This will get all of the nfts from kyc server
  void sendSearchNftRequest({String? keywords = ''}) async {
    final packed = Any.pack(SearchNftRequest(keywords: keywords));
    final base64Request = await XmppUtils.signEncryptAndSendMessageToNormal(packed);
    sendMessage(base64Request);
  }

  /// This will send *[Erc20MintRequest] to kyc server and
  /// its response has been handled in *[MarketCubit].
  void sendMintRequest({required String signedTransaction}) async {
    final packed = Any.pack(Erc20MintRequest(signedTransaction: signedTransaction));
    final base64Request = await XmppUtils.signEncryptAndSendMessageToNormal(packed);
    sendMessage(base64Request);
  }

  /// This will send *[Erc20ApproveRequest] to kyc server and
  /// its response has been handled in *[MarketCubit].
  void sendErc20ApproveRequest({required String signedTransaction}) async {
    final packed = Any.pack(Erc20ApproveRequest(signedTransaction: signedTransaction));
    final base64Request = await XmppUtils.signEncryptAndSendMessageToNormal(packed);
    sendMessage(base64Request);
  }

  /// This will send *[DepositRequest] to kyc server and
  /// its response has been handled in *[BalanceCubit].
  void sendDepositRequest({required String message, required String signature}) async {
    final packed = Any.pack(DepositRequest(message: message, signature: signature));
    final base64Request = await XmppUtils.signEncryptAndSendMessageToNormal(packed);
    sendMessage(base64Request);
  }

  /// This will send *[InitiateNFTPurchaseRequest] to kyc server and
  /// its response has been handled in *[MarketCubit].
  void sendInitiateNFTPurchaseRequest({
    required int nftType,
    required String userAddress,
  }) async {
    final packed = Any.pack(InitiateNFTPurchaseRequest(nftType: nftType, userAddress: userAddress));
    final base64Request = await XmppUtils.signEncryptAndSendMessageToNormal(packed);
    sendMessage(base64Request);
  }

  /// This will send *[ChallengeSignedRequest] to kyc server and
  /// its response has been handled in *[MarketCubit].
  void sendChallengeSignedRequest({
    required String challenge,
    required String signedChallenge,
    required String userAddress,
    required Payment payment,
  }) async {
    final packed = Any.pack(ChallengeSignedRequest(
      challenge: challenge,
      signedChallenge: signedChallenge,
      userAddress: userAddress,
      payment: payment,
    ));
    final base64Request = await XmppUtils.signEncryptAndSendMessageToNormal(packed);
    sendMessage(base64Request);
  }

  /// This will send *[UserTokenRequest] to kyc server and
  /// its response has been handled in *[GalleryCubit].
  void sendUserTokenRequest() async {
    final packed = Any.pack(UserTokenRequest());
    final base64Request = await XmppUtils.signEncryptAndSendMessageToNormal(packed);
    sendMessage(base64Request);
  }
}
