import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'kyc_contact.g.dart';

@HiveType(typeId: 1)
class KycContact extends HiveObject with EquatableMixin {
  /// The owner of account in/by which this contact has been saved.
  @HiveField(0)
  String? ownerJid;

  /// The jid of current actual saved contact.
  @HiveField(1)
  String? jid;

  @HiveField(2)
  String? blockchainAddress;

  @HiveField(3)
  String? nickName;

  @HiveField(4)
  String? fullName;

  @HiveField(5)
  String? image;

  @HiveField(6)
  num? trustLevel;

  @override
  List<Object?> get props => [ownerJid, jid, blockchainAddress, nickName, fullName, trustLevel];
}
