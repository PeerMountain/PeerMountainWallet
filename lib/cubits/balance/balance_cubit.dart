import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/error-dto.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/deposit.pb.dart';
import 'package:kyc3/utils/app_events.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(const BalanceState.loading());

  StreamSubscription? _responsesSubscription;

  Future<void> initSubscription() async {
    /// do not subscribe more than once.
    _responsesSubscription?.cancel();
    _responsesSubscription = eventBus.on<BalanceCubitResponses>().listen((event) {
      final response = event.response;
      switch (response.runtimeType) {
        case DepositResponse:
          handleDepositResponse(response);
          break;

        case ErrorDto:
          handleErrorResponse(response);
          break;
        default:
          break;
      }
    });
  }

  Future<List<dynamic>?> checkAllMintedTokenBalance() async => await web3Repository.getMintablePMTNTokens();

  Future<List<dynamic>?> checkPmtnBalance() async => await web3Repository.getDepositedPMTNTokens();

  Future<List<dynamic>?> checkAllowanceBalance() async => await web3Repository.checkPmtnTokenAllowance();

  Future<bool> sendDepositRequest(int amount) async {
    final response = await web3Repository.depositAmount(amount);

    showLog("sendDepositRequest =====>>> $response");

    await Future.delayed(const Duration(seconds: 3));

    if (response == Keys.success) {
      showSuccessDialog(description: Strings.depositSuccess);
      return true;
    } else {
      showErrorDialog(description: somethingWentWrongM);
    }
    return false;
  }

  Future<void> handleErrorResponse(ErrorDto response) async {
    emit(BalanceState.failure(reason: response.message));
  }

  Future<void> handleDepositResponse(DepositResponse response) async {
    showLog("handleDepositResponse =====>>> ${response.depositTransactionHash}");
    if (response.depositTransactionHash.isNotBlank) {
      showSuccessSnackbar(Strings.pmtnTokensAdded);
      emit(const BalanceState.requestBalance());
    } else {
      showErrorSnackbar();
    }
  }
}
