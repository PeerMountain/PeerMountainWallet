part of 'nft_details_cubit.dart';

class NftDetailsState extends Equatable {
  /// will be used for maintaining state of [NftDetailsScreen]
  final CubitState status;
  final dynamic details;

  /// shared error message
  final String? errorMessage;

  const NftDetailsState._({
    this.status = CubitState.initial,
    this.details,
    this.errorMessage,
  });

  const NftDetailsState.loading() : this._(status: CubitState.loading);

  const NftDetailsState.success(dynamic item)
      : this._(
          status: CubitState.success,
          details: item,
        );

  const NftDetailsState.failure({String? reason})
      : this._(
          status: CubitState.failure,
          errorMessage: reason,
        );

  @override
  List<Object?> get props => [status, errorMessage, details];
}
