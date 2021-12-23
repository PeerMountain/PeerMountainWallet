import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/error-dto.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/nft.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/signed-nft.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/payment/payment.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/challenge-signed.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/erc20.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/initiate-nft-purchase.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/search-nft.pb.dart';
import 'package:kyc3/models/hive_adapters/invoices/kyc_invoice.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/utils/app_events.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked_services/stacked_services.dart';

import 'confirm_payment_invoice.dart';

part 'market_state.dart';

class MarketCubit<T> extends Cubit<MarketPlaceState> {
  MarketCubit() : super(const MarketPlaceState.loading());

  StreamSubscription? _responsesSubscription;

  String? initiateNftPurchaseSignature;
  InitiateNFTPurchaseResponse? initiateNFTPurchaseResponse;

  Future<void> initSubscription() async {
    /// do not subscribe more than once.

    _responsesSubscription?.cancel();
    _responsesSubscription = eventBus.on<MarketCubitResponses>().listen((event) {
      final response = event.response;
      switch (response.runtimeType) {
        case SearchNftRequest:
          getNftsList();
          break;

        /// Only be called when we receive *[SearchNftRequest] from kyc server
        case SearchNftResponse:
          handleSearchNftResponse(response);
          break;

        /// Only be called when we receive *[Erc20MintRequest] from kyc server
        case Erc20MintResponse:
          handleErc20MintResponse(response);
          break;

        /// Only be called when we receive *[Erc20ApproveRequest] from kyc server
        case Erc20ApproveResponse:
          handleErc20ApproveResponse(response);
          break;

        case InitiateNFTPurchaseResponse:
          handleInitiateNFTPurchaseResponse(response);
          break;

        case ChallengeSignedResponse:
          handleChallengeSignedResponse(response);
          break;

        case ErrorDto:
          handleErrorResponse(response);
          break;
        default:
          break;
      }
    });
  }

  void cancelAllSubs() {
    _responsesSubscription?.cancel();
  }

  Future<void> handleErrorResponse(ErrorDto response) async {
    emit(MarketPlaceState.failure(reason: response.message));
  }

  Future<void> getNftsList({String? keywords = ''}) async {
    emit(const MarketPlaceState.loading());
    normalSendService.sendSearchNftRequest(keywords: keywords);
  }

  Future<void> handleSearchNftResponse(SearchNftResponse response) async {
    emit(MarketPlaceState.success(response.nftSettingsList));
  }

  Future<void> handleErc20MintResponse(Erc20MintResponse response) async {
    showLog("_handleErc20MintResponse =====>>> ${response.transactionHash}");

    final allowance = await web3Repository.checkPmtnTokenAllowance();

    if (allowance != null && allowance.isNotEmpty) {
      final amount = (allowance[0] as BigInt).toDouble();
      if (amount == 0.0) {
        final approve = await web3Repository.approveAmount(Web3Repository.amountToMintAndApprove);
        if (approve != null && approve.isNotBlank) {
          normalSendService.sendErc20ApproveRequest(signedTransaction: approve);
        }
      }
    }
  }

  Future<void> handleErc20ApproveResponse(Erc20ApproveResponse response) async {
    showLog("_handleErc20ApproveResponse =====>>> ${response.transactionHash}");
    showLog("${Web3Repository.amountToMintAndApprove} amount has been approved for current user.");
  }

  void purchaseNft(NftSettings nft) async {
    showLoader();
    normalSendService.sendInitiateNFTPurchaseRequest(
      nftType: nft.type,
      userAddress: cryptoAccount.address!,
    );
  }

  Future<void> handleInitiateNFTPurchaseResponse(InitiateNFTPurchaseResponse response) async {
    /// MUST
    /// SAVE LAST RESPONSE to local variable because we have to use
    /// its value to append purchase redirectUrl returned by server for this NFT purchase
    ///
    initiateNFTPurchaseResponse = response;
    showLog("_handleInitiateNFTPurchaseResponse =====>>> $initiateNFTPurchaseResponse");

    hideLoader();

    final isPayClicked = await showMaterialModalBottomSheet(
      context: StackedService.navigatorKey!.currentContext!,
      enableDrag: true,
      builder: (_) {
        return ConfirmPaymentInvoiceDialog(
          initiateNFTPurchaseResponse: response,
          nftSettings: getNftDetails(response.nftType)!.nft,
        );
      },
    );

    /// if pay is clicked then this result will be true
    /// otherwise it will always be null or false
    if (isPayClicked == true) {
      showLoader();

      final kValues = await web3Repository.encodePaymentValues(
        challenge: response.challenge,
        attestationProvider: response.invoice.attestationProvider,
        price: response.invoice.price,
        paymentNonce: response.invoice.paymentNonce.toInt(),
      );

      if (kValues != null && kValues.isNotEmpty == true) {
        /// string encoded message
        final message = kValues[0];

        /// signature of above obtained message
        final messageSignature = kValues[1];
        final messageSign = messageSignature[Keys.signature]!;

        /// signature of challenge received from server
        final challengeSignature = kValues[2]!;
        final signedChallenge = challengeSignature[Keys.signature]!;

        /// save this for later use in  [_handleChallengeSignedResponse()]
        initiateNftPurchaseSignature = signedChallenge;

        /// send request
        normalSendService.sendChallengeSignedRequest(
          challenge: response.challenge,
          signedChallenge: signedChallenge!,
          userAddress: cryptoAccount.address!,
          payment: Payment(message: message, signature: messageSign!),
        );

        await addInvoiceToLocalStorage(response);

        hideLoader();
      }

      /// [hideLoader()] for this will be called in [_handleChallengeSignedResponse()]
      showPaymentProgressNotification();
    }
  }

  Future<void> handleChallengeSignedResponse(ChallengeSignedResponse response) async {
    showLog("_handleChallengeSignedResponse =====>>> $response");
    hideLoader();

    /// This should NOT be NULL because we have to append server url with
    if (initiateNFTPurchaseResponse != null) {
      final kResponse = initiateNFTPurchaseResponse!;
      final redirectUrl = "${response.redirectUrl}&challenge=${kResponse.challenge}"
          "&nftType=${kResponse.nftType}"
          "&signature=${initiateNftPurchaseSignature!}"
          "&address=${kResponse.userAddress}";

      final result = await navigationService.navigateTo(
        Routes.purchaseNftWebview.value,
        arguments: StringOnlyArguments(redirectUrl: redirectUrl),
      );

      if (result == Keys.success) {
        updateInvoiceStatus(kResponse.invoice.paymentNonce.toInt(), "payment_success");

        showSuccessDialog(
          title: Strings.purchasedSuccess,
          description: "NFT has been purchased successfully!",
        );
      } else {
        updateInvoiceStatus(kResponse.invoice.paymentNonce.toInt(), "payment_failed");
        showErrorSnackbar("Couldn't purchase NFT!");
      }
    }
  }

  SignedNftSettings? getNftDetails(int nftType) {
    final list = state.items.toList();
    try {
      final s = list.firstWhere((element) => element.nft.type.toString() == nftType.toString());
      return s;
    } catch (e) {
      showLog("getNftDetails exception =====>>> $e");
    }
  }

  Future<void> addInvoiceToLocalStorage(InitiateNFTPurchaseResponse response) async {
    final invoice = KycInvoice()
      ..nftType = response.nftType
      ..userAddress = response.userAddress
      ..challenge = response.challenge
      ..attestationProvider = response.invoice.attestationProvider
      ..price = response.invoice.price
      ..paymentNonce = response.invoice.paymentNonce.toInt()
      ..cashierAddress = response.invoice.cashierAddress
      ..createAtInMillis = DateTime.now().toUtc().millisecondsSinceEpoch
      ..updatedAtInMillis = DateTime.now().toUtc().millisecondsSinceEpoch
      ..status = "pending";
    await hiveStorage.addInvoiceToLocal(invoice);
  }

  Future<void> updateInvoiceStatus(int paymentNonce, String status) async {
    final invoice = hiveStorage.getAllInvoices()?.firstWhereOrNull(
          (element) => element.paymentNonce == paymentNonce,
        );
    if (invoice != null) {
      invoice.status = status;
      if (status.contains("success")) {
        invoice.purchasedAtInMillis = DateTime.now().toUtc().millisecondsSinceEpoch;
      } else {
        invoice.failedAtInMillis = DateTime.now().toUtc().millisecondsSinceEpoch;
      }
      await hiveStorage.updateInvoiceToLocal(invoice);
    }
  }
}
