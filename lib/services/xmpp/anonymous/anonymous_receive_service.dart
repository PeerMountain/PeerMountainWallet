import 'dart:async';

import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/exchange.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/login-challenge.pbserver.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/register.pb.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/utils/app_events.dart';
import 'package:xmpp_stone/xmpp_stone.dart';

/// All of the messages RECEIVED through *[AnonymousReceiveService]
/// has been handled in this class.

class AnonymousReceiveService {
  AnonymousReceiveService._();

  static AnonymousReceiveService get instance => AnonymousReceiveService._();

  StreamSubscription? _subscription;

  bool isNewUser = false;

  /// Safely listen messages for ONE TIME ONLY
  Future<void> initResponseListeners() async {
    /// do not subscribe more than once.
    _subscription?.cancel();
    _subscription = eventBus.on<GMEvent>().listen((event) async {
      final message = event.message;

      if (event.status == true && message != null) {
        if (message.canUnpackInto(ExchangeKeysResponse())) {
          serverAccount = message.unpackInto(ExchangeKeysResponse());
          handleExchangeKeyResponse();
          return;
        } else if (message.canUnpackInto(LoginChallengeResponse())) {
          final response = message.unpackInto(LoginChallengeResponse());

          /// User is already registered so just sign in him/her.
          if (response.registered == false) {
            /// This is to register user on our kyc server
            handleLoginResponseForNewUser();
          } else {
            /// This is to login existing user on our kyc server
            handleLoginResponseForExistingUser(
              address: response.address,
              challenge: response.challenge,
            );
          }

          return;
        } else if (message.canUnpackInto(InitiateUserXMPPRegistrationResponse())) {
          final response = message.unpackInto(InitiateUserXMPPRegistrationResponse());
          handleInitiateUserXMPPRegistrationResponse(
            address: response.address,
            challenge: response.challenge,
          );
          return;
        } else if (message.canUnpackInto(RegisterUserResponse())) {
          final response = message.unpackInto(RegisterUserResponse());
          handleExchangeKeyResponse();
          return;
        } else {
          hideLoader();
          showErrorSnackbar(event.error);
        }
      } else {
        /// Show error message
        hideLoader();
        showErrorSnackbar(event.error);
      }
    });
  }

  void cancelSubscription() {
    _subscription!.cancel();
  }

  /// Step 2
  ///
  /// Now send *[LoginChallengeRequest] request to server for user login
  /// and then server will respond back with *[LoginChallengeResponse].

  void handleExchangeKeyResponse() {
    try {
      anonymousSendService.sendLoginChallengeRequest(
        userAddress: cryptoAccount.address!,
        userPublicKey: cryptoAccount.publicKey!,
        privateKey: cryptoAccount.privateKey!,
      );
    } catch (e, stackTrace) {
      hideLoader();
      showLog("sendLoginChallengeRequest exception =====>>> $e");
      showLog("sendLoginChallengeRequest stackTrace =====>>> $stackTrace");
    }
  }

  /// Step 3
  ///
  /// Now send *[InitiateUserXMPPRegistrationRequest] when we need to first signup user on kyc server.
  /// and then server will respond back with *[InitiateUserXMPPRegistrationResponse].

  void handleLoginResponseForNewUser() {
    try {
      anonymousSendService.sendInitiateUserXMPPRegistrationRequest(
        userAddress: cryptoAccount.address!,
        userPublicKey: cryptoAccount.publicKey!,
        privateKey: cryptoAccount.privateKey!,
      );
    } catch (e, stackTrace) {
      hideLoader();
      showLog("sendInitiateUserXMPPRegistrationRequest exception =====>>> $e");
      showLog("sendInitiateUserXMPPRegistrationRequest stackTrace =====>>> $stackTrace");
    }
  }

  /// Step 3.1
  ///
  /// Now send *[RegisterUserRequest] to signup user on kyc server
  /// and then server will respond back with *[RegisterUserResponse].

  void handleInitiateUserXMPPRegistrationResponse({required String address, required String challenge}) {
    try {
      anonymousSendService.sendRegisterUserRequest(userAddress: address, challenge: challenge);
    } catch (e, stackTrace) {
      hideLoader();
      showLog("registerUserOnServer exception =====>>> $e");
      showLog("registerUserOnServer stackTrace =====>>> $stackTrace");
    }
  }

  /// Step 4
  ///
  /// This will close Anonymous Channel and NOW WE WILL USE AUTHENTICATED
  /// XMPP CHANNEL FOR EVERY API OR REQUEST SENT TO SERVER AND
  /// ALL THIS WILL BE HANDLED IN *[NormalXmppService]

  void handleLoginResponseForExistingUser({
    required String address,
    required String challenge,
  }) async {
    /// Sign challenged received from server
    final signature = await web3Service.signPersonalMessage(payload: challenge);

    hideLoader();
    anonymousService.closeXmpp();

    /// Will be TRUE ONLY if user is signing in / signing up for the 1st time only
    /// Else false if he is trying to open app after successful
    /// signup and previously logged in successfully.
    if (isNewUser) {
      showLoader();
    }

    normalXmppService.openNormalXmppConnection(
      username: address,
      password: signature![Keys.signature],
      onConnectionStateChange: (status) async {
        if (status == XmppConnectionState.Ready) {
          showLog("We're connected to authenticated server!");

          /// Once connected to NORMAL xmpp channel we need to again send
          /// exchangeKeysRequest over normal server.
          normalReceiveService.initResponseListeners();

          normalSendService.sendExchangeKeyRequest(
            username: "",
            address: cryptoAccount.address!,
            publicKey: cryptoAccount.encodedPublicKey!,
            publicEncryptionKey: cryptoAccount.publicKey!,
          );
        } else if (status == XmppConnectionState.AuthenticationFailure) {
          hideLoader();
          showLog("Authentication failed!!!!");
          showErrorDialog(
            title: Strings.authenticationFailed,
            description: somethingWentWrongM,
          );
        } else if (status == XmppConnectionState.Closed) {
          hideLoader();
          showLog("Connection has been closed!!!!");
        } else {
          /// do nothing meanwhile loader has been shown
        }
      },
    );
  }
}
