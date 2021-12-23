///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/submit-attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use submitAttestationDataRequestDescriptor instead')
const SubmitAttestationDataRequest$json = const {
  '1': 'SubmitAttestationDataRequest',
  '2': const [
    const {'1': 'nft_type', '3': 1, '4': 1, '5': 5, '10': 'nftType'},
    const {'1': 'customer_address', '3': 2, '4': 1, '5': 9, '10': 'customerAddress'},
    const {'1': 'data', '3': 3, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `SubmitAttestationDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitAttestationDataRequestDescriptor = $convert.base64Decode('ChxTdWJtaXRBdHRlc3RhdGlvbkRhdGFSZXF1ZXN0EhkKCG5mdF90eXBlGAEgASgFUgduZnRUeXBlEikKEGN1c3RvbWVyX2FkZHJlc3MYAiABKAlSD2N1c3RvbWVyQWRkcmVzcxISCgRkYXRhGAMgASgJUgRkYXRh');
@$core.Deprecated('Use submitAttestationDataResponseDescriptor instead')
const SubmitAttestationDataResponse$json = const {
  '1': 'SubmitAttestationDataResponse',
  '2': const [
    const {'1': 'nft_type', '3': 1, '4': 1, '5': 5, '10': 'nftType'},
    const {'1': 'customer_address', '3': 2, '4': 1, '5': 9, '10': 'customerAddress'},
    const {'1': 'data', '3': 3, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `SubmitAttestationDataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitAttestationDataResponseDescriptor = $convert.base64Decode('Ch1TdWJtaXRBdHRlc3RhdGlvbkRhdGFSZXNwb25zZRIZCghuZnRfdHlwZRgBIAEoBVIHbmZ0VHlwZRIpChBjdXN0b21lcl9hZGRyZXNzGAIgASgJUg9jdXN0b21lckFkZHJlc3MSEgoEZGF0YRgDIAEoCVIEZGF0YQ==');
