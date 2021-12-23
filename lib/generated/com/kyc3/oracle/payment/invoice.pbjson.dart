///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/payment/invoice.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use invoiceDescriptor instead')
const Invoice$json = const {
  '1': 'Invoice',
  '2': const [
    const {'1': 'attestation_provider', '3': 1, '4': 1, '5': 9, '10': 'attestationProvider'},
    const {'1': 'price', '3': 2, '4': 1, '5': 5, '10': 'price'},
    const {'1': 'payment_nonce', '3': 3, '4': 1, '5': 3, '10': 'paymentNonce'},
    const {'1': 'cashier_address', '3': 4, '4': 1, '5': 9, '10': 'cashierAddress'},
  ],
};

/// Descriptor for `Invoice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invoiceDescriptor = $convert.base64Decode('CgdJbnZvaWNlEjEKFGF0dGVzdGF0aW9uX3Byb3ZpZGVyGAEgASgJUhNhdHRlc3RhdGlvblByb3ZpZGVyEhQKBXByaWNlGAIgASgFUgVwcmljZRIjCg1wYXltZW50X25vbmNlGAMgASgDUgxwYXltZW50Tm9uY2USJwoPY2FzaGllcl9hZGRyZXNzGAQgASgJUg5jYXNoaWVyQWRkcmVzcw==');
