import 'dart:convert';

import 'package:equatable/equatable.dart';

enum MessageType { text, payment, request }

extension MsgEnumExt on String {
  MessageType toMessageType() {
    switch (this) {
      case 'text':
        return MessageType.text;
      case 'payment':
        return MessageType.payment;
      case 'request':
        return MessageType.request;
      default:
        return MessageType.text;
    }
  }
}

class ChatModel extends Equatable {
  final String? senderJid;
  final String? senderNickname;
  final String? senderFullname;
  final String? senderProfileUrl;
  final String? receiverJid;
  final String? receiverNickname;
  final String? receiverFullname;
  final String? receiverProfileUrl;
  final int? createdOn;
  final int? updatedOn;
  final String? message;
  final String? deviceName;
  final String? deviceManufacturer;
  final String? operatingSystem;
  final num? lat;
  final num? lng;
  final String? location;
  final MessageType messageType;

  const ChatModel({
    this.senderJid,
    this.senderNickname,
    this.senderFullname,
    this.senderProfileUrl,
    this.receiverJid,
    this.receiverNickname,
    this.receiverFullname,
    this.receiverProfileUrl,
    this.createdOn,
    this.updatedOn,
    this.message,
    this.deviceName,
    this.deviceManufacturer,
    this.operatingSystem,
    this.lat,
    this.lng,
    this.location,
    required this.messageType,
  });

  String encodeValues() => jsonEncode(this);

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        senderJid: json['sender_jid'] as String?,
        senderNickname: json['sender_nick_name'] as String?,
        senderFullname: json['sender_full_name'] as String?,
        senderProfileUrl: json['sender_profile_url'] as String?,
        receiverJid: json['receiver_jid'] as String?,
        receiverNickname: json['receiver_nick_name'] as String?,
        receiverFullname: json['receiver_full_name'] as String?,
        receiverProfileUrl: json['receiver_profile_url'] as String?,
        createdOn: json['created_on'] as int?,
        updatedOn: json['updated_on'] as int?,
        message: json['message'] as String?,
        deviceName: json['device_name'] as String?,
        deviceManufacturer: json['device_manufacturer'] as String?,
        operatingSystem: json['operating_system'] as String?,
        lat: json['lat'] as num?,
        lng: json['lng'] as num?,
        location: json['location'] as String?,
        messageType: (json['message_type'] as String?)!.toMessageType(),
      );

  Map<String, dynamic> toJson() => {
        'sender_jid': senderJid,
        'sender_full_name': senderFullname,
        'sender_nick_name': senderNickname,
        'sender_profile_url': senderProfileUrl,
        'receiver_jid': receiverJid,
        'receiver_full_name': receiverFullname,
        'receiver_nick_name': receiverNickname,
        'receiver_profile_url': receiverProfileUrl,
        'created_on': createdOn,
        'updated_on': updatedOn,
        'message': message,
        'device_name': deviceName,
        'device_manufacturer': deviceManufacturer,
        'operating_system': operatingSystem,
        'lat': lat,
        'lng': lng,
        'location': location,
        'message_type': messageType.value,
      };

  ChatModel copyWith({
    String? senderJid,
    String? senderNickname,
    String? senderFullname,
    String? senderProfileUrl,
    String? receiverJid,
    String? receiverNickname,
    String? receiverFullname,
    String? receiverProfileUrl,
    String? rec,
    int? createdOn,
    int? updatedOn,
    String? message,
    String? deviceName,
    String? deviceManufacturer,
    String? operatingSystem,
    num? lat,
    num? lng,
    String? location,
    MessageType? messageType,
  }) {
    return ChatModel(
      senderJid: senderJid ?? this.senderJid,
      senderNickname: senderNickname ?? this.senderNickname,
      senderFullname: senderFullname ?? this.senderFullname,
      senderProfileUrl: senderProfileUrl ?? this.senderProfileUrl,
      receiverJid: receiverJid ?? this.receiverJid,
      receiverNickname: receiverNickname ?? this.receiverNickname,
      receiverFullname: receiverFullname ?? this.receiverFullname,
      receiverProfileUrl: receiverProfileUrl ?? this.receiverProfileUrl,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      message: message ?? this.message,
      deviceName: deviceName ?? this.deviceName,
      deviceManufacturer: deviceManufacturer ?? this.deviceManufacturer,
      operatingSystem: operatingSystem ?? this.operatingSystem,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      location: location ?? this.location,
      messageType: messageType ?? this.messageType,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        senderJid,
        receiverJid,
        createdOn,
        updatedOn,
        message,
        deviceName,
        deviceManufacturer,
        operatingSystem,
        lat,
        lng,
        location,
        messageType,
      ];
}

extension RouteExt on MessageType {
  String get value => toString().split(".").last;
}
