import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/error-dto.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/search-nft.pb.dart';
import 'package:kyc3/ui/main_screen/marketplace/nft_details/nft_details_screen.dart';
import 'package:kyc3/utils/app_events.dart';

part 'nft_details_state.dart';

class NftDetailsCubit<T> extends Cubit<NftDetailsState> {
  NftDetailsCubit() : super(const NftDetailsState.loading());

  StreamSubscription? _responsesSubscription;

  Future<void> initSubscription() async {
    /// do not subscribe more than once.

    _responsesSubscription?.cancel();
    _responsesSubscription = eventBus.on<NftDetailsCubitResponses>().listen((event) {
      final response = event.response;
      switch (response.runtimeType) {

        /// Only be called when we receive *[SearchNftRequest] from kyc server
        case SearchNftResponse:
          _handleSearchNftResponse(response);
          break;

        case ErrorDto:
          _handleErrorResponse(response);
          break;
        default:
          break;
      }
    });
  }

  void cancelAllSubs() {
    _responsesSubscription?.cancel();
  }

  Future<void> _handleErrorResponse(ErrorDto response) async {
    emit(NftDetailsState.failure(reason: response.message));
  }

  Future<void> _handleSearchNftResponse(SearchNftResponse response) async {
    emit(NftDetailsState.success(response.nftSettingsList));
  }

// SignedNftSettings? getNftDetails(Token token) {
//   final list = state.items.toList();
//   try {
//     final s = list.firstWhere((element) => element.nft.type.toString() == token.nftType.toString());
//     return s;
//   } catch (e) {
//     showLog("getNftDetails exception =====>>> $e");
//   }
// }
}
