///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/nft-mint.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use nftMintRequestDescriptor instead')
const NftMintRequest$json = const {
  '1': 'NftMintRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'signature', '3': 2, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `NftMintRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nftMintRequestDescriptor = $convert.base64Decode('Cg5OZnRNaW50UmVxdWVzdBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdlEhwKCXNpZ25hdHVyZRgCIAEoCVIJc2lnbmF0dXJl');
@$core.Deprecated('Use nftMintResponseDescriptor instead')
const NftMintResponse$json = const {
  '1': 'NftMintResponse',
  '2': const [
    const {'1': 'nft_mint_transaction_hash', '3': 1, '4': 1, '5': 9, '10': 'nftMintTransactionHash'},
    const {'1': 'token', '3': 2, '4': 1, '5': 11, '6': '.com.kyc3.oracle.nft.Token', '10': 'token'},
  ],
};

/// Descriptor for `NftMintResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nftMintResponseDescriptor = $convert.base64Decode('Cg9OZnRNaW50UmVzcG9uc2USOQoZbmZ0X21pbnRfdHJhbnNhY3Rpb25faGFzaBgBIAEoCVIWbmZ0TWludFRyYW5zYWN0aW9uSGFzaBIwCgV0b2tlbhgCIAEoCzIaLmNvbS5reWMzLm9yYWNsZS5uZnQuVG9rZW5SBXRva2Vu');
