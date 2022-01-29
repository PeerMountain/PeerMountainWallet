import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/error-dto.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/token.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/nft-transfer.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/search-nft.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/user-token.pb.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/utils/app_events.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  StreamSubscription? _responsesSubscription;

  int tempTokenId = -1;
  List<Token> tokens = [];

  Future<void> initSubscription() async {
    /// do not subscribe more than once.

    _responsesSubscription?.cancel();
    _responsesSubscription = eventBus.on<GalleryCubitResponses>().listen((event) {
      final response = event.response;
      switch (response.runtimeType) {
        case SearchNftResponse:
        case UserTokenRequest:
          getUserPurchasedNfts();
          break;
        case UserTokenResponse:
          handleUserTokenResponse(response);
          break;
        case NftTransferResponse:
          handleNftTransferResponse(response);
          break;

        case ErrorDto:
          handleErrorResponse(response);
          break;
        default:
          break;
      }
    });
  }

  void getUserPurchasedNfts() {
    emit(GalleryLoad());
    normalSendService.sendUserTokenRequest();
  }

  void handleUserTokenResponse(UserTokenResponse response) {
    tokens = response.tokens;
    emit(GallerySuccess(response.tokens));
  }

  Future<void> handleErrorResponse(ErrorDto response) async {
    showLog("_handleErrorResponse =====>>> $response");
    emit(GalleryFailed(errorMessage: response.message));
  }

  /// This will send NftTransferRequest to kyc server and
  ///
  /// if its response is SUCCESS then the selected NFT's OWNERSHIP
  /// WILL BE TRANSFERRED TO SELECTED RECEIVER'S ADDRESS'S ACCOUNT.
  ///
  /// if FALSE then no effect.
  void transferNftOwnership(String receiverAddress, int tokenId) async {
    showLoader();
    final response = await web3Repository.encodeAndSendNftTransferRequest(
      receiverAddress: receiverAddress,
      tokenId: tokenId,
    );
    hideLoader();

    if (response == Keys.success) {
      tempTokenId = tokenId;
      showSuccessDialog(
        title: Strings.requestAccepted,
        description: "Nft ownership transfer request has been accepted. "
            "\n\nWe'll notify you once transfer process is completed.\n\nThank you.",
      );
    } else {
      showErrorDialog(
        title: Strings.error,
        description: somethingWentWrongM,
      );
    }
  }

  Future<void> handleNftTransferResponse(NftTransferResponse response) async {
    showLog("handleNftTransferResponse =====>>> ${response.transactionHash}");

    if (tempTokenId != -1) {
      tokens.removeWhere((element) => element.tokenId == tempTokenId);
      emit(GalleryChange(tokens));

      // TODO: Send notification to receiver that you've received an nft from current user.
    }

    showSuccessDialog(
      title: Strings.transferCompleted,
      description: "Your request for NFT Ownership Transfer has been completed successfully.\n\nThank you.",
    );
  }
}
