import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'kyc_invoice.g.dart';

@HiveType(typeId: 2)
class KycInvoice extends HiveObject with EquatableMixin {
  /// The owner of account in/by which this contact has been saved.
  @HiveField(0)
  int? nftType;

  @HiveField(1)
  String? userAddress;

  @HiveField(2)
  String? challenge;

  @HiveField(3)
  String? attestationProvider;

  @HiveField(4)
  int? price;

  @HiveField(5)
  num? paymentNonce;

  @HiveField(6)
  String? cashierAddress;

  @HiveField(7)
  String? status;

  @HiveField(8)
  int? createAtInMillis;

  @HiveField(9)
  int? updatedAtInMillis;

  @HiveField(10)
  int? purchasedAtInMillis;

  @HiveField(11)
  int? failedAtInMillis;

  @override
  List<Object?> get props => [
        nftType,
        userAddress,
        challenge,
        attestationProvider,
        price,
        paymentNonce,
        cashierAddress,
        status,
        createAtInMillis,
        updatedAtInMillis,
        purchasedAtInMillis,
        failedAtInMillis,
      ];
}
