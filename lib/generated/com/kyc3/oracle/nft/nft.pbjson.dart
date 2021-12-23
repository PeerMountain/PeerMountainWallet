///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/nft/nft.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use nftSettingsDescriptor instead')
const NftSettings$json = const {
  '1': 'NftSettings',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'price', '3': 2, '4': 1, '5': 5, '10': 'price'},
    const {'1': 'expiration', '3': 3, '4': 1, '5': 3, '10': 'expiration'},
    const {'1': 'attestation_provider', '3': 4, '4': 1, '5': 9, '10': 'attestationProvider'},
    const {'1': 'signed_message', '3': 5, '4': 1, '5': 9, '10': 'signedMessage'},
    const {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'image_url', '3': 8, '4': 1, '5': 9, '10': 'imageUrl'},
  ],
};

/// Descriptor for `NftSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nftSettingsDescriptor = $convert.base64Decode('CgtOZnRTZXR0aW5ncxISCgR0eXBlGAEgASgFUgR0eXBlEhQKBXByaWNlGAIgASgFUgVwcmljZRIeCgpleHBpcmF0aW9uGAMgASgDUgpleHBpcmF0aW9uEjEKFGF0dGVzdGF0aW9uX3Byb3ZpZGVyGAQgASgJUhNhdHRlc3RhdGlvblByb3ZpZGVyEiUKDnNpZ25lZF9tZXNzYWdlGAUgASgJUg1zaWduZWRNZXNzYWdlEhIKBG5hbWUYBiABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YByABKAlSC2Rlc2NyaXB0aW9uEhsKCWltYWdlX3VybBgIIAEoCVIIaW1hZ2VVcmw=');
