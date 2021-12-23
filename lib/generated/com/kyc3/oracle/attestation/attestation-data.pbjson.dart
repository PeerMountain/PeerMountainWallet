///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/attestation/attestation-data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use attestationDataDescriptor instead')
const AttestationData$json = const {
  '1': 'AttestationData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'customer_address', '3': 3, '4': 1, '5': 9, '10': 'customerAddress'},
    const {'1': 'data', '3': 4, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'hash_key_array', '3': 5, '4': 1, '5': 9, '10': 'hashKeyArray'},
    const {'1': 'token_uri', '3': 6, '4': 1, '5': 9, '10': 'tokenUri'},
    const {'1': 'hashed_data', '3': 7, '4': 1, '5': 9, '10': 'hashedData'},
    const {'1': 'nft_type', '3': 8, '4': 1, '5': 5, '10': 'nftType'},
  ],
};

/// Descriptor for `AttestationData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attestationDataDescriptor = $convert.base64Decode('Cg9BdHRlc3RhdGlvbkRhdGESDgoCaWQYASABKANSAmlkEikKEGN1c3RvbWVyX2FkZHJlc3MYAyABKAlSD2N1c3RvbWVyQWRkcmVzcxISCgRkYXRhGAQgASgJUgRkYXRhEiQKDmhhc2hfa2V5X2FycmF5GAUgASgJUgxoYXNoS2V5QXJyYXkSGwoJdG9rZW5fdXJpGAYgASgJUgh0b2tlblVyaRIfCgtoYXNoZWRfZGF0YRgHIAEoCVIKaGFzaGVkRGF0YRIZCghuZnRfdHlwZRgIIAEoBVIHbmZ0VHlwZQ==');
@$core.Deprecated('Use signedAttestationDataDescriptor instead')
const SignedAttestationData$json = const {
  '1': 'SignedAttestationData',
  '2': const [
    const {'1': 'attestation', '3': 1, '4': 1, '5': 11, '6': '.com.kyc3.oracle.attestation.AttestationData', '10': 'attestation'},
    const {'1': 'signed_message', '3': 2, '4': 1, '5': 9, '10': 'signedMessage'},
  ],
};

/// Descriptor for `SignedAttestationData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedAttestationDataDescriptor = $convert.base64Decode('ChVTaWduZWRBdHRlc3RhdGlvbkRhdGESTgoLYXR0ZXN0YXRpb24YASABKAsyLC5jb20ua3ljMy5vcmFjbGUuYXR0ZXN0YXRpb24uQXR0ZXN0YXRpb25EYXRhUgthdHRlc3RhdGlvbhIlCg5zaWduZWRfbWVzc2FnZRgCIAEoCVINc2lnbmVkTWVzc2FnZQ==');
