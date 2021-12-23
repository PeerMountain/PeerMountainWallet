///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/create-nft.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createNftRequestDescriptor instead')
const CreateNftRequest$json = const {
  '1': 'CreateNftRequest',
  '2': const [
    const {'1': 'nft_settings', '3': 1, '4': 1, '5': 11, '6': '.com.kyc3.oracle.nft.NftSettings', '10': 'nftSettings'},
  ],
};

/// Descriptor for `CreateNftRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createNftRequestDescriptor = $convert.base64Decode('ChBDcmVhdGVOZnRSZXF1ZXN0EkMKDG5mdF9zZXR0aW5ncxgBIAEoCzIgLmNvbS5reWMzLm9yYWNsZS5uZnQuTmZ0U2V0dGluZ3NSC25mdFNldHRpbmdz');
@$core.Deprecated('Use createNftResponseDescriptor instead')
const CreateNftResponse$json = const {
  '1': 'CreateNftResponse',
  '2': const [
    const {'1': 'nft_settings_list', '3': 1, '4': 3, '5': 11, '6': '.com.kyc3.oracle.nft.NftSettings', '10': 'nftSettingsList'},
  ],
};

/// Descriptor for `CreateNftResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createNftResponseDescriptor = $convert.base64Decode('ChFDcmVhdGVOZnRSZXNwb25zZRJMChFuZnRfc2V0dGluZ3NfbGlzdBgBIAMoCzIgLmNvbS5reWMzLm9yYWNsZS5uZnQuTmZ0U2V0dGluZ3NSD25mdFNldHRpbmdzTGlzdA==');
