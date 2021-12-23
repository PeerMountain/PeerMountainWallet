///
//  Generated code. Do not modify.
//  source: com/kyc3/exchange.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use exchangeKeysRequestDescriptor instead')
const ExchangeKeysRequest$json = const {
  '1': 'ExchangeKeysRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'public_key', '3': 2, '4': 1, '5': 9, '10': 'publicKey'},
    const {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'public_encryption_key', '3': 4, '4': 1, '5': 9, '10': 'publicEncryptionKey'},
  ],
};

/// Descriptor for `ExchangeKeysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeKeysRequestDescriptor = $convert.base64Decode('ChNFeGNoYW5nZUtleXNSZXF1ZXN0EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIdCgpwdWJsaWNfa2V5GAIgASgJUglwdWJsaWNLZXkSGAoHYWRkcmVzcxgDIAEoCVIHYWRkcmVzcxIyChVwdWJsaWNfZW5jcnlwdGlvbl9rZXkYBCABKAlSE3B1YmxpY0VuY3J5cHRpb25LZXk=');
@$core.Deprecated('Use exchangeKeysResponseDescriptor instead')
const ExchangeKeysResponse$json = const {
  '1': 'ExchangeKeysResponse',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'public_key', '3': 2, '4': 1, '5': 9, '10': 'publicKey'},
    const {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'public_encryption_key', '3': 4, '4': 1, '5': 9, '10': 'publicEncryptionKey'},
  ],
};

/// Descriptor for `ExchangeKeysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeKeysResponseDescriptor = $convert.base64Decode('ChRFeGNoYW5nZUtleXNSZXNwb25zZRIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSHQoKcHVibGljX2tleRgCIAEoCVIJcHVibGljS2V5EhgKB2FkZHJlc3MYAyABKAlSB2FkZHJlc3MSMgoVcHVibGljX2VuY3J5cHRpb25fa2V5GAQgASgJUhNwdWJsaWNFbmNyeXB0aW9uS2V5');
