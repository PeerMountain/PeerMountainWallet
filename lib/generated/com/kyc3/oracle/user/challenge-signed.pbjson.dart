///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/challenge-signed.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use challengeSignedRequestDescriptor instead')
const ChallengeSignedRequest$json = const {
  '1': 'ChallengeSignedRequest',
  '2': const [
    const {'1': 'challenge', '3': 1, '4': 1, '5': 9, '10': 'challenge'},
    const {'1': 'signed_challenge', '3': 2, '4': 1, '5': 9, '10': 'signedChallenge'},
    const {'1': 'user_address', '3': 3, '4': 1, '5': 9, '10': 'userAddress'},
    const {'1': 'payment', '3': 4, '4': 1, '5': 11, '6': '.com.kyc3.oracle.payment.Payment', '10': 'payment'},
  ],
};

/// Descriptor for `ChallengeSignedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeSignedRequestDescriptor = $convert.base64Decode('ChZDaGFsbGVuZ2VTaWduZWRSZXF1ZXN0EhwKCWNoYWxsZW5nZRgBIAEoCVIJY2hhbGxlbmdlEikKEHNpZ25lZF9jaGFsbGVuZ2UYAiABKAlSD3NpZ25lZENoYWxsZW5nZRIhCgx1c2VyX2FkZHJlc3MYAyABKAlSC3VzZXJBZGRyZXNzEjoKB3BheW1lbnQYBCABKAsyIC5jb20ua3ljMy5vcmFjbGUucGF5bWVudC5QYXltZW50UgdwYXltZW50');
@$core.Deprecated('Use challengeSignedResponseDescriptor instead')
const ChallengeSignedResponse$json = const {
  '1': 'ChallengeSignedResponse',
  '2': const [
    const {'1': 'redirect_url', '3': 1, '4': 1, '5': 9, '10': 'redirectUrl'},
  ],
};

/// Descriptor for `ChallengeSignedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeSignedResponseDescriptor = $convert.base64Decode('ChdDaGFsbGVuZ2VTaWduZWRSZXNwb25zZRIhCgxyZWRpcmVjdF91cmwYASABKAlSC3JlZGlyZWN0VXJs');
