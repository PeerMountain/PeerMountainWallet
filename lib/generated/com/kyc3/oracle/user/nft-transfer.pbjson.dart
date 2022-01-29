///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/nft-transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use nftTransferRequestDescriptor instead')
const NftTransferRequest$json = const {
  '1': 'NftTransferRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'signature', '3': 2, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `NftTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nftTransferRequestDescriptor = $convert.base64Decode('ChJOZnRUcmFuc2ZlclJlcXVlc3QSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIcCglzaWduYXR1cmUYAiABKAlSCXNpZ25hdHVyZQ==');
@$core.Deprecated('Use nftTransferResponseDescriptor instead')
const NftTransferResponse$json = const {
  '1': 'NftTransferResponse',
  '2': const [
    const {'1': 'transaction_hash', '3': 1, '4': 1, '5': 9, '10': 'transactionHash'},
  ],
};

/// Descriptor for `NftTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nftTransferResponseDescriptor = $convert.base64Decode('ChNOZnRUcmFuc2ZlclJlc3BvbnNlEikKEHRyYW5zYWN0aW9uX2hhc2gYASABKAlSD3RyYW5zYWN0aW9uSGFzaA==');
