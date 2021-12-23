///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/request-attestation-list.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use attestationDataListRequestDescriptor instead')
const AttestationDataListRequest$json = const {
  '1': 'AttestationDataListRequest',
  '2': const [
    const {'1': 'customer_address', '3': 1, '4': 1, '5': 9, '10': 'customerAddress'},
  ],
};

/// Descriptor for `AttestationDataListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attestationDataListRequestDescriptor = $convert.base64Decode('ChpBdHRlc3RhdGlvbkRhdGFMaXN0UmVxdWVzdBIpChBjdXN0b21lcl9hZGRyZXNzGAEgASgJUg9jdXN0b21lckFkZHJlc3M=');
@$core.Deprecated('Use attestationDataListResponseDescriptor instead')
const AttestationDataListResponse$json = const {
  '1': 'AttestationDataListResponse',
  '2': const [
    const {'1': 'user_data', '3': 1, '4': 3, '5': 11, '6': '.com.kyc3.oracle.attestation.SignedAttestationData', '10': 'userData'},
  ],
};

/// Descriptor for `AttestationDataListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attestationDataListResponseDescriptor = $convert.base64Decode('ChtBdHRlc3RhdGlvbkRhdGFMaXN0UmVzcG9uc2USTwoJdXNlcl9kYXRhGAEgAygLMjIuY29tLmt5YzMub3JhY2xlLmF0dGVzdGF0aW9uLlNpZ25lZEF0dGVzdGF0aW9uRGF0YVIIdXNlckRhdGE=');
