///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/register.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use initiateUserXMPPRegistrationRequestDescriptor instead')
const InitiateUserXMPPRegistrationRequest$json = const {
  '1': 'InitiateUserXMPPRegistrationRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `InitiateUserXMPPRegistrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateUserXMPPRegistrationRequestDescriptor = $convert.base64Decode('CiNJbml0aWF0ZVVzZXJYTVBQUmVnaXN0cmF0aW9uUmVxdWVzdBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNz');
@$core.Deprecated('Use initiateUserXMPPRegistrationResponseDescriptor instead')
const InitiateUserXMPPRegistrationResponse$json = const {
  '1': 'InitiateUserXMPPRegistrationResponse',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'challenge', '3': 2, '4': 1, '5': 9, '10': 'challenge'},
  ],
};

/// Descriptor for `InitiateUserXMPPRegistrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateUserXMPPRegistrationResponseDescriptor = $convert.base64Decode('CiRJbml0aWF0ZVVzZXJYTVBQUmVnaXN0cmF0aW9uUmVzcG9uc2USGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcxIcCgljaGFsbGVuZ2UYAiABKAlSCWNoYWxsZW5nZQ==');
@$core.Deprecated('Use registerUserRequestDescriptor instead')
const RegisterUserRequest$json = const {
  '1': 'RegisterUserRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'signed_challenge', '3': 2, '4': 1, '5': 9, '10': 'signedChallenge'},
  ],
};

/// Descriptor for `RegisterUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerUserRequestDescriptor = $convert.base64Decode('ChNSZWdpc3RlclVzZXJSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSKQoQc2lnbmVkX2NoYWxsZW5nZRgCIAEoCVIPc2lnbmVkQ2hhbGxlbmdl');
@$core.Deprecated('Use registerUserResponseDescriptor instead')
const RegisterUserResponse$json = const {
  '1': 'RegisterUserResponse',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `RegisterUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerUserResponseDescriptor = $convert.base64Decode('ChRSZWdpc3RlclVzZXJSZXNwb25zZRIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNz');
