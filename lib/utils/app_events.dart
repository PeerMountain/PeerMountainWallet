import 'package:equatable/equatable.dart';
import 'package:kyc3/cubits/balance/balance_cubit.dart';
import 'package:kyc3/generated/google/protobuf/any.pb.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_cubit.dart';

enum CubitState { initial, loading, success, failure }

class GMEvent extends Equatable {
  /// TRUE :- SUCCESS
  /// FALSE :- FAILED
  final bool status;

  final Any? message;
  final String from;

  /// Will be null if *[message] != null and
  /// Will NOT be null if *[message] == null
  final String? error;

  const GMEvent({required this.status, required this.from, this.message, this.error});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [status, from, message, error];
}

class GalleryCubitResponses<T> extends Equatable {
  /// For all of the response received in [BalanceCubit] will use
  /// generic response type and will cast actual response when received in bloc.
  final T? request;
  final T? response;

  const GalleryCubitResponses({this.request, this.response});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [request, response];
}

class MarketCubitResponses<T> extends Equatable {
  /// For all of the response received in *[MarketCubit] will use
  /// generic response type and will cast actual response when received in bloc.

  final T? request;
  final T? response;

  const MarketCubitResponses({this.request, this.response});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [request, response];
}

class NftDetailsCubitResponses<T> extends Equatable {
  /// For all of the response received in *[NftDetailsCubit] will use
  /// generic response type and will cast actual response when received in bloc.

  final T? request;
  final T? response;

  const NftDetailsCubitResponses({this.request, this.response});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [request, response];
}

class BalanceCubitResponses<T> extends Equatable {
  /// For all of the response received in [BalanceCubit] will use
  /// generic response type and will cast actual response when received in bloc.

  final T? response;

  const BalanceCubitResponses({this.response});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [response];
}

class ChatEvent<T> extends Equatable {
  final T? message;
  final String from;

  const ChatEvent({required this.from, this.message});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [from, message];
}
