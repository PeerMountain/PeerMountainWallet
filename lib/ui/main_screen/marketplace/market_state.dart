part of 'market_cubit.dart';

class MarketPlaceState extends Equatable {
  const MarketPlaceState._({
    this.status = CubitState.loading,
    this.items = const <SignedNftSettings>[],
    this.errorMessage,
  });

  const MarketPlaceState.loading() : this._();

  const MarketPlaceState.success(List<SignedNftSettings> items)
      : this._(status: CubitState.success, items: items);

  const MarketPlaceState.failure({String? reason})
      : this._(
          status: CubitState.failure,
          errorMessage: reason,
        );

  final CubitState status;
  final String? errorMessage;
  final List<SignedNftSettings> items;

  @override
  List<Object?> get props => [status, errorMessage, items];
}
