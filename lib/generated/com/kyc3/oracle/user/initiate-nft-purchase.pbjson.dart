///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/initiate-nft-purchase.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use initiateNFTPurchaseRequestDescriptor instead')
const InitiateNFTPurchaseRequest$json = const {
  '1': 'InitiateNFTPurchaseRequest',
  '2': const [
    const {'1': 'nft_type', '3': 1, '4': 1, '5': 5, '10': 'nftType'},
    const {'1': 'user_address', '3': 2, '4': 1, '5': 9, '10': 'userAddress'},
  ],
};

/// Descriptor for `InitiateNFTPurchaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateNFTPurchaseRequestDescriptor = $convert.base64Decode('ChpJbml0aWF0ZU5GVFB1cmNoYXNlUmVxdWVzdBIZCghuZnRfdHlwZRgBIAEoBVIHbmZ0VHlwZRIhCgx1c2VyX2FkZHJlc3MYAiABKAlSC3VzZXJBZGRyZXNz');
@$core.Deprecated('Use initiateNFTPurchaseResponseDescriptor instead')
const InitiateNFTPurchaseResponse$json = const {
  '1': 'InitiateNFTPurchaseResponse',
  '2': const [
    const {'1': 'nft_type', '3': 1, '4': 1, '5': 5, '10': 'nftType'},
    const {'1': 'user_address', '3': 2, '4': 1, '5': 9, '10': 'userAddress'},
    const {'1': 'challenge', '3': 3, '4': 1, '5': 9, '10': 'challenge'},
    const {'1': 'invoice', '3': 4, '4': 1, '5': 11, '6': '.com.kyc3.oracle.payment.Invoice', '10': 'invoice'},
  ],
};

/// Descriptor for `InitiateNFTPurchaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List initiateNFTPurchaseResponseDescriptor = $convert.base64Decode('ChtJbml0aWF0ZU5GVFB1cmNoYXNlUmVzcG9uc2USGQoIbmZ0X3R5cGUYASABKAVSB25mdFR5cGUSIQoMdXNlcl9hZGRyZXNzGAIgASgJUgt1c2VyQWRkcmVzcxIcCgljaGFsbGVuZ2UYAyABKAlSCWNoYWxsZW5nZRI6CgdpbnZvaWNlGAQgASgLMiAuY29tLmt5YzMub3JhY2xlLnBheW1lbnQuSW52b2ljZVIHaW52b2ljZQ==');
