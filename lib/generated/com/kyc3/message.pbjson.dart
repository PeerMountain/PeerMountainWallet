///
//  Generated code. Do not modify.
//  source: com/kyc3/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use signedAnonymousMessageDescriptor instead')
const SignedAnonymousMessage$json = const {
  '1': 'SignedAnonymousMessage',
  '2': const [
    const {'1': 'signature', '3': 1, '4': 1, '5': 9, '10': 'signature'},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'public_key', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
    const {'1': 'message', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'message'},
  ],
};

/// Descriptor for `SignedAnonymousMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedAnonymousMessageDescriptor = $convert.base64Decode('ChZTaWduZWRBbm9ueW1vdXNNZXNzYWdlEhwKCXNpZ25hdHVyZRgBIAEoCVIJc2lnbmF0dXJlEhgKB2FkZHJlc3MYAiABKAlSB2FkZHJlc3MSHQoKcHVibGljX2tleRgDIAEoCVIJcHVibGljS2V5Ei4KB21lc3NhZ2UYBCABKAsyFC5nb29nbGUucHJvdG9idWYuQW55UgdtZXNzYWdl');
@$core.Deprecated('Use signedAddressedMessageDescriptor instead')
const SignedAddressedMessage$json = const {
  '1': 'SignedAddressedMessage',
  '2': const [
    const {'1': 'signature', '3': 1, '4': 1, '5': 9, '10': 'signature'},
    const {'1': 'public_key', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
    const {'1': 'message', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'message'},
  ],
};

/// Descriptor for `SignedAddressedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedAddressedMessageDescriptor = $convert.base64Decode('ChZTaWduZWRBZGRyZXNzZWRNZXNzYWdlEhwKCXNpZ25hdHVyZRgBIAEoCVIJc2lnbmF0dXJlEh0KCnB1YmxpY19rZXkYAyABKAlSCXB1YmxpY0tleRIuCgdtZXNzYWdlGAQgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIHbWVzc2FnZQ==');
@$core.Deprecated('Use signedMessageDescriptor instead')
const SignedMessage$json = const {
  '1': 'SignedMessage',
  '2': const [
    const {'1': 'anonymous', '3': 1, '4': 1, '5': 11, '6': '.com.kyc3.SignedAnonymousMessage', '9': 0, '10': 'anonymous'},
    const {'1': 'addressed', '3': 2, '4': 1, '5': 11, '6': '.com.kyc3.SignedAddressedMessage', '9': 0, '10': 'addressed'},
  ],
  '8': const [
    const {'1': 'body'},
  ],
};

/// Descriptor for `SignedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedMessageDescriptor = $convert.base64Decode('Cg1TaWduZWRNZXNzYWdlEkAKCWFub255bW91cxgBIAEoCzIgLmNvbS5reWMzLlNpZ25lZEFub255bW91c01lc3NhZ2VIAFIJYW5vbnltb3VzEkAKCWFkZHJlc3NlZBgCIAEoCzIgLmNvbS5reWMzLlNpZ25lZEFkZHJlc3NlZE1lc3NhZ2VIAFIJYWRkcmVzc2VkQgYKBGJvZHk=');
@$core.Deprecated('Use encryptedMessageDescriptor instead')
const EncryptedMessage$json = const {
  '1': 'EncryptedMessage',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'nonce', '3': 2, '4': 1, '5': 9, '10': 'nonce'},
    const {'1': 'ephem_public_key', '3': 3, '4': 1, '5': 9, '10': 'ephemPublicKey'},
    const {'1': 'cipher_text', '3': 4, '4': 1, '5': 9, '10': 'cipherText'},
  ],
};

/// Descriptor for `EncryptedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encryptedMessageDescriptor = $convert.base64Decode('ChBFbmNyeXB0ZWRNZXNzYWdlEhgKB3ZlcnNpb24YASABKAlSB3ZlcnNpb24SFAoFbm9uY2UYAiABKAlSBW5vbmNlEigKEGVwaGVtX3B1YmxpY19rZXkYAyABKAlSDmVwaGVtUHVibGljS2V5Eh8KC2NpcGhlcl90ZXh0GAQgASgJUgpjaXBoZXJUZXh0');
@$core.Deprecated('Use generalMessageDescriptor instead')
const GeneralMessage$json = const {
  '1': 'GeneralMessage',
  '2': const [
    const {'1': 'exchange', '3': 1, '4': 1, '5': 11, '6': '.com.kyc3.ExchangeKeysRequest', '9': 0, '10': 'exchange'},
    const {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.com.kyc3.EncryptedMessage', '9': 0, '10': 'message'},
  ],
  '8': const [
    const {'1': 'body'},
  ],
};

/// Descriptor for `GeneralMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generalMessageDescriptor = $convert.base64Decode('Cg5HZW5lcmFsTWVzc2FnZRI7CghleGNoYW5nZRgBIAEoCzIdLmNvbS5reWMzLkV4Y2hhbmdlS2V5c1JlcXVlc3RIAFIIZXhjaGFuZ2USNgoHbWVzc2FnZRgCIAEoCzIaLmNvbS5reWMzLkVuY3J5cHRlZE1lc3NhZ2VIAFIHbWVzc2FnZUIGCgRib2R5');
