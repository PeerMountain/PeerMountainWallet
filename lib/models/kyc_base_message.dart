import 'package:equatable/equatable.dart';

class KycBaseMessage extends Equatable {
  final String? type;
  final String? message;

  const KycBaseMessage({this.type, this.message});

  factory KycBaseMessage.fromJson(Map<String, dynamic> json) => KycBaseMessage(
        type: json['type'] as String?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'message': message,
      };

  KycBaseMessage copyWith({
    String? type,
    String? message,
  }) {
    return KycBaseMessage(
      type: type ?? this.type,
      message: message ?? this.message,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [type, message];
}
