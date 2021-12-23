import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/error-dto.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/token.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/user-token.pb.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/utils/app_events.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  StreamSubscription? _responsesSubscription;

  Future<void> initSubscription() async {
    /// do not subscribe more than once.

    _responsesSubscription?.cancel();
    _responsesSubscription = eventBus.on<GalleryCubitResponses>().listen((event) {
      final response = event.response;
      switch (response.runtimeType) {
        case UserTokenResponse:
          handleUserTokenResponse(response);
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
    emit(GallerySuccess(response.tokens));
  }

  Future<void> handleErrorResponse(ErrorDto response) async {
    showLog("_handleErrorResponse =====>>> $response");
    emit(GalleryFailed(errorMessage: response.message));
  }
}
