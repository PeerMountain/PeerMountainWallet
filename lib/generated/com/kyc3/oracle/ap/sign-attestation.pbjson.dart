///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/sign-attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use signAttestationDataRequestDescriptor instead')
const SignAttestationDataRequest$json = const {
  '1': 'SignAttestationDataRequest',
  '2': const [
    const {'1': 'attestation_data_id', '3': 1, '4': 1, '5': 3, '10': 'attestationDataId'},
    const {'1': 'signed_message', '3': 2, '4': 1, '5': 9, '10': 'signedMessage'},
  ],
};

/// Descriptor for `SignAttestationDataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signAttestationDataRequestDescriptor = $convert.base64Decode('ChpTaWduQXR0ZXN0YXRpb25EYXRhUmVxdWVzdBIuChNhdHRlc3RhdGlvbl9kYXRhX2lkGAEgASgDUhFhdHRlc3RhdGlvbkRhdGFJZBIlCg5zaWduZWRfbWVzc2FnZRgCIAEoCVINc2lnbmVkTWVzc2FnZQ==');
@$core.Deprecated('Use signAttestationDataResponseDescriptor instead')
const SignAttestationDataResponse$json = const {
  '1': 'SignAttestationDataResponse',
};

/// Descriptor for `SignAttestationDataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signAttestationDataResponseDescriptor = $convert.base64Decode('ChtTaWduQXR0ZXN0YXRpb25EYXRhUmVzcG9uc2U=');
