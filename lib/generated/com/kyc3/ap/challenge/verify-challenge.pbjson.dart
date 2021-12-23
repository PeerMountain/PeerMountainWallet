///
//  Generated code. Do not modify.
//  source: com/kyc3/ap/challenge/verify-challenge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use verifyChallengeRequestDescriptor instead')
const VerifyChallengeRequest$json = const {
  '1': 'VerifyChallengeRequest',
  '2': const [
    const {'1': 'challenge', '3': 1, '4': 1, '5': 9, '10': 'challenge'},
    const {'1': 'signed_challenge', '3': 2, '4': 1, '5': 9, '10': 'signedChallenge'},
    const {'1': 'user_address', '3': 3, '4': 1, '5': 9, '10': 'userAddress'},
    const {'1': 'user_public_key', '3': 4, '4': 1, '5': 9, '10': 'userPublicKey'},
  ],
};

/// Descriptor for `VerifyChallengeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyChallengeRequestDescriptor = $convert.base64Decode('ChZWZXJpZnlDaGFsbGVuZ2VSZXF1ZXN0EhwKCWNoYWxsZW5nZRgBIAEoCVIJY2hhbGxlbmdlEikKEHNpZ25lZF9jaGFsbGVuZ2UYAiABKAlSD3NpZ25lZENoYWxsZW5nZRIhCgx1c2VyX2FkZHJlc3MYAyABKAlSC3VzZXJBZGRyZXNzEiYKD3VzZXJfcHVibGljX2tleRgEIAEoCVINdXNlclB1YmxpY0tleQ==');
@$core.Deprecated('Use verifyChallengeResponseDescriptor instead')
const VerifyChallengeResponse$json = const {
  '1': 'VerifyChallengeResponse',
  '2': const [
    const {'1': 'user_public_key', '3': 1, '4': 1, '5': 9, '10': 'userPublicKey'},
    const {'1': 'redirect_url', '3': 2, '4': 1, '5': 9, '10': 'redirectUrl'},
    const {'1': 'user_address', '3': 3, '4': 1, '5': 9, '10': 'userAddress'},
  ],
};

/// Descriptor for `VerifyChallengeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyChallengeResponseDescriptor = $convert.base64Decode('ChdWZXJpZnlDaGFsbGVuZ2VSZXNwb25zZRImCg91c2VyX3B1YmxpY19rZXkYASABKAlSDXVzZXJQdWJsaWNLZXkSIQoMcmVkaXJlY3RfdXJsGAIgASgJUgtyZWRpcmVjdFVybBIhCgx1c2VyX2FkZHJlc3MYAyABKAlSC3VzZXJBZGRyZXNz');
