part of 'chat_cubit.dart';

class ChatState<T> extends Equatable {
  const ChatState._({
    this.status = CubitState.initial,
    this.chats,
    this.errorMessage,
  });

  const ChatState.initial() : this._();

  const ChatState.loading() : this._(status: CubitState.loading);

  const ChatState.success(List<T> chats) : this._(status: CubitState.success, chats: chats);

  const ChatState.failure({String? reason})
      : this._(
          status: CubitState.failure,
          errorMessage: reason,
        );

  final CubitState status;
  final String? errorMessage;
  final List<T>? chats;

  @override
  List<Object?> get props => [status, errorMessage, chats];
}
