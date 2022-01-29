import 'dart:async';

import 'package:kyc3/app/app.dart';
import 'package:kyc3/cubits/balance/balance_cubit.dart';
import 'package:kyc3/generated/com/kyc3/error-dto.pb.dart';
import 'package:kyc3/generated/com/kyc3/exchange.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/challenge-signed.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/deposit.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/erc20.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/initiate-nft-purchase.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/nft-transfer.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/search-nft.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/user-token.pb.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/ui/main_screen/gallery/gallery_cubit.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_cubit.dart';
import 'package:kyc3/utils/app_events.dart';

/// All of the messages RECEIVED through *[NormalXmppService]
/// has been handled in this class.

class NormalReceiveService {
  NormalReceiveService._();

  static NormalReceiveService get instance => NormalReceiveService._();

  StreamSubscription? _subscription;

  bool _isInitial = true;

  /// Safely listen messages for ONE TIME ONLY
  Future<void> initResponseListeners() async {
    /// do not subscribe more than once.

    _subscription?.cancel();
    _subscription = eventBus.on<GMEvent>().listen((event) async {
      final message = event.message;
      if (event.status == true && message != null) {
        if (message.canUnpackInto(ExchangeKeysResponse())) {
          serverAccount = message.unpackInto(ExchangeKeysResponse());
          _handleExchangeKeysResponse();
          return;
        }
        if (message.canUnpackInto(SearchNftResponse())) {
          _handleSearchNftResponse(message.unpackInto(SearchNftResponse()));
          return;
        }
        if (message.canUnpackInto(Erc20MintResponse())) {
          _handleErc20MintResponse(message.unpackInto(Erc20MintResponse()));
          return;
        }
        if (message.canUnpackInto(Erc20ApproveResponse())) {
          _handleErc20ApproveResponse(message.unpackInto(Erc20ApproveResponse()));
          return;
        }
        if (message.canUnpackInto(DepositResponse())) {
          _handleDepositResponse(message.unpackInto(DepositResponse()));
          return;
        }
        if (message.canUnpackInto(InitiateNFTPurchaseResponse())) {
          _handleInitiateNFTPurchaseResponse(message.unpackInto(InitiateNFTPurchaseResponse()));
          return;
        }
        if (message.canUnpackInto(ChallengeSignedResponse())) {
          _handleChallengeSignedResponse(message.unpackInto(ChallengeSignedResponse()));
          return;
        }
        if (message.canUnpackInto(UserTokenResponse())) {
          _handleUserTokenResponse(message.unpackInto(UserTokenResponse()));
          return;
        }
        if (message.canUnpackInto(NftTransferResponse())) {
          _handleNftTransferResponse(message.unpackInto(NftTransferResponse()));
          return;
        }
        if (message.canUnpackInto(ErrorDto())) {
          final error = message.unpackInto(ErrorDto());
          showErrorSnackbar(error.message);
          eventBus.fire(GalleryCubitResponses(response: error));
        }
      } else {
        /// Show error message
        showErrorSnackbar(event.error);
      }
    });
  }

  void cancelSubscription() {
    _subscription!.cancel();
  }

  void _handleExchangeKeysResponse() {
    showLog("_handleExchangeKeysResponse is completed!");
    hideLoader();

    /// to refresh user gallery list on initial app launch ONLY
    _isInitial = true;

    /// This will be TRUE ONLY If user is signing up or creating new wallet
    if (anonymousReceiveService.isNewUser) {
      anonymousReceiveService.isNewUser = false;
      navUtils.gotoMainScreen(sendRequest: true);
    } else {
      showLog("don't do anything user is already on main screen.");
      eventBus.fire(MarketCubitResponses(response: SearchNftRequest()));
      showSuccessSnackbar("Connected to server!!");

      /// CHECK FOR USER MINT/ALLOWANCE/APPROVE AMOUNT
      web3Repository.performMintAllowanceApproveAmountFlow();
    }
  }

  /// See *[MarketCubit] for more information and
  /// check response handler in [MarketCubit.handleSearchNftResponse]
  void _handleSearchNftResponse(SearchNftResponse response) {
    eventBus.fire(MarketCubitResponses(response: response));

    /// to refresh user gallery list on initial app launch ONLY
    if (_isInitial) {
      _isInitial = false;
      eventBus.fire(GalleryCubitResponses(response: response));
    }
  }

  /// See *[MarketCubit] for more information and
  /// check response handler in [MarketCubit.handleErc20MintResponse]
  void _handleErc20MintResponse(Erc20MintResponse response) {
    eventBus.fire(MarketCubitResponses(response: response));
  }

  /// See *[MarketCubit] for more information and
  /// check response handler in [MarketCubit.handleErc20ApproveResponse]
  void _handleErc20ApproveResponse(Erc20ApproveResponse response) {
    eventBus.fire(MarketCubitResponses(response: response));
  }

  /// See *[BalanceCubit] for more information.
  /// check response handler in [BalanceCubit.handleDepositResponse]
  void _handleDepositResponse(DepositResponse response) {
    eventBus.fire(BalanceCubitResponses(response: response));
  }

  /// See *[MarketCubit] for more information.
  /// check response handler in [MarketCubit.handleInitiateNFTPurchaseResponse]
  void _handleInitiateNFTPurchaseResponse(InitiateNFTPurchaseResponse response) {
    eventBus.fire(MarketCubitResponses(response: response));
  }

  /// See *[MarketCubit] for more information.
  /// check response handler in [MarketCubit.handleChallengeSignedResponse]
  void _handleChallengeSignedResponse(ChallengeSignedResponse response) {
    eventBus.fire(MarketCubitResponses(response: response));
  }

  /// See *[GalleryCubit] for more information.
  /// check response handler in [GalleryCubit.handleUserTokenResponse]
  void _handleUserTokenResponse(UserTokenResponse response) {
    eventBus.fire(GalleryCubitResponses(response: response));
  }

  /// See *[GalleryCubit] for more information.
  /// check response handler in [GalleryCubit.handleNftTransferResponse]
  void _handleNftTransferResponse(NftTransferResponse response) {
    eventBus.fire(GalleryCubitResponses(response: response));
  }
}
