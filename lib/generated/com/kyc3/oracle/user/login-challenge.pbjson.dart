///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/login-challenge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginChallengeRequestDescriptor instead')
const LoginChallengeRequest$json = const {
  '1': 'LoginChallengeRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `LoginChallengeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginChallengeRequestDescriptor = $convert.base64Decode('ChVMb2dpbkNoYWxsZW5nZVJlcXVlc3QSGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcw==');
@$core.Deprecated('Use loginChallengeResponseDescriptor instead')
const LoginChallengeResponse$json = const {
  '1': 'LoginChallengeResponse',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'challenge', '3': 2, '4': 1, '5': 9, '10': 'challenge'},
    const {'1': 'registered', '3': 3, '4': 1, '5': 8, '10': 'registered'},
  ],
};

/// Descriptor for `LoginChallengeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginChallengeResponseDescriptor = $convert.base64Decode('ChZMb2dpbkNoYWxsZW5nZVJlc3BvbnNlEhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSHAoJY2hhbGxlbmdlGAIgASgJUgljaGFsbGVuZ2USHgoKcmVnaXN0ZXJlZBgDIAEoCFIKcmVnaXN0ZXJlZA==');
