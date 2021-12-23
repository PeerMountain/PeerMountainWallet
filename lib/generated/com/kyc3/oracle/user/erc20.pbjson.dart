///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/erc20.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use erc20MintRequestDescriptor instead')
const Erc20MintRequest$json = const {
  '1': 'Erc20MintRequest',
  '2': const [
    const {'1': 'signed_transaction', '3': 1, '4': 1, '5': 9, '10': 'signedTransaction'},
  ],
};

/// Descriptor for `Erc20MintRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List erc20MintRequestDescriptor = $convert.base64Decode('ChBFcmMyME1pbnRSZXF1ZXN0Ei0KEnNpZ25lZF90cmFuc2FjdGlvbhgBIAEoCVIRc2lnbmVkVHJhbnNhY3Rpb24=');
@$core.Deprecated('Use erc20MintResponseDescriptor instead')
const Erc20MintResponse$json = const {
  '1': 'Erc20MintResponse',
  '2': const [
    const {'1': 'transaction_hash', '3': 1, '4': 1, '5': 9, '10': 'transactionHash'},
  ],
};

/// Descriptor for `Erc20MintResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List erc20MintResponseDescriptor = $convert.base64Decode('ChFFcmMyME1pbnRSZXNwb25zZRIpChB0cmFuc2FjdGlvbl9oYXNoGAEgASgJUg90cmFuc2FjdGlvbkhhc2g=');
@$core.Deprecated('Use erc20ApproveRequestDescriptor instead')
const Erc20ApproveRequest$json = const {
  '1': 'Erc20ApproveRequest',
  '2': const [
    const {'1': 'signed_transaction', '3': 1, '4': 1, '5': 9, '10': 'signedTransaction'},
  ],
};

/// Descriptor for `Erc20ApproveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List erc20ApproveRequestDescriptor = $convert.base64Decode('ChNFcmMyMEFwcHJvdmVSZXF1ZXN0Ei0KEnNpZ25lZF90cmFuc2FjdGlvbhgBIAEoCVIRc2lnbmVkVHJhbnNhY3Rpb24=');
@$core.Deprecated('Use erc20ApproveResponseDescriptor instead')
const Erc20ApproveResponse$json = const {
  '1': 'Erc20ApproveResponse',
  '2': const [
    const {'1': 'transaction_hash', '3': 1, '4': 1, '5': 9, '10': 'transactionHash'},
  ],
};

/// Descriptor for `Erc20ApproveResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List erc20ApproveResponseDescriptor = $convert.base64Decode('ChRFcmMyMEFwcHJvdmVSZXNwb25zZRIpChB0cmFuc2FjdGlvbl9oYXNoGAEgASgJUg90cmFuc2FjdGlvbkhhc2g=');
