part of 'balance_cubit.dart';

enum BalanceCubitState { initial, loading, success, failure, requestBalance }

class BalanceState<T> extends Equatable {
  const BalanceState._({
    this.status = BalanceCubitState.loading,
    this.response,
    this.errorMessage,
  });

  const BalanceState.loading() : this._();

  const BalanceState.success(T response) : this._(status: BalanceCubitState.success, response: response);

  const BalanceState.failure({String? reason})
      : this._(
          status: BalanceCubitState.failure,
          errorMessage: reason,
        );

  const BalanceState.requestBalance() : this._(status: BalanceCubitState.requestBalance);

  final BalanceCubitState status;
  final String? errorMessage;
  final T? response;

  @override
  List<Object?> get props => [status, errorMessage, response];
}
