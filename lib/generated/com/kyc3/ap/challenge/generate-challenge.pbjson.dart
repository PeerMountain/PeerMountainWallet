///
//  Generated code. Do not modify.
//  source: com/kyc3/ap/challenge/generate-challenge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use generateChallengeRequestDescriptor instead')
const GenerateChallengeRequest$json = const {
  '1': 'GenerateChallengeRequest',
  '2': const [
    const {'1': 'user_address', '3': 1, '4': 1, '5': 9, '10': 'userAddress'},
    const {'1': 'user_public_key', '3': 2, '4': 1, '5': 9, '10': 'userPublicKey'},
    const {'1': 'nft_type', '3': 3, '4': 1, '5': 5, '10': 'nftType'},
  ],
};

/// Descriptor for `GenerateChallengeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateChallengeRequestDescriptor = $convert.base64Decode('ChhHZW5lcmF0ZUNoYWxsZW5nZVJlcXVlc3QSIQoMdXNlcl9hZGRyZXNzGAEgASgJUgt1c2VyQWRkcmVzcxImCg91c2VyX3B1YmxpY19rZXkYAiABKAlSDXVzZXJQdWJsaWNLZXkSGQoIbmZ0X3R5cGUYAyABKAVSB25mdFR5cGU=');
@$core.Deprecated('Use generateChallengeResponseDescriptor instead')
const GenerateChallengeResponse$json = const {
  '1': 'GenerateChallengeResponse',
  '2': const [
    const {'1': 'challenge', '3': 1, '4': 1, '5': 11, '6': '.com.kyc3.ap.challenge.Challenge', '10': 'challenge'},
    const {'1': 'user_address', '3': 2, '4': 1, '5': 9, '10': 'userAddress'},
    const {'1': 'user_public_key', '3': 3, '4': 1, '5': 9, '10': 'userPublicKey'},
    const {'1': 'nft_type', '3': 4, '4': 1, '5': 5, '10': 'nftType'},
  ],
};

/// Descriptor for `GenerateChallengeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateChallengeResponseDescriptor = $convert.base64Decode('ChlHZW5lcmF0ZUNoYWxsZW5nZVJlc3BvbnNlEj4KCWNoYWxsZW5nZRgBIAEoCzIgLmNvbS5reWMzLmFwLmNoYWxsZW5nZS5DaGFsbGVuZ2VSCWNoYWxsZW5nZRIhCgx1c2VyX2FkZHJlc3MYAiABKAlSC3VzZXJBZGRyZXNzEiYKD3VzZXJfcHVibGljX2tleRgDIAEoCVINdXNlclB1YmxpY0tleRIZCghuZnRfdHlwZRgEIAEoBVIHbmZ0VHlwZQ==');
