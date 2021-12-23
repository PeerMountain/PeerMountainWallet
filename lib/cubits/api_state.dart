import 'package:equatable/equatable.dart';

abstract class ApiState<T> extends Equatable {}

class InitialState extends ApiState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ApiState {
  @override
  List<Object> get props => [];
}

class SuccessState<T> extends ApiState {
  SuccessState(this.response);

  final T response;

  @override
  List<Object> get props => [response as Object];
}

class ErrorState extends ApiState {
  @override
  List<Object> get props => [];
}
