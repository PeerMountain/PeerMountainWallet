import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/google/protobuf/any.pb.dart';

class ParsedMessage {
  final bool isValid;
  final Any? message;
  final String? error;

  const ParsedMessage({
    required this.isValid,
    this.message,
    this.error = somethingWentWrongN,
  });
}
