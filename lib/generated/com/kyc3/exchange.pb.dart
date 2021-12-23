///
//  Generated code. Do not modify.
//  source: com/kyc3/exchange.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ExchangeKeysRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExchangeKeysRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicEncryptionKey')
    ..hasRequiredFields = false
  ;

  ExchangeKeysRequest._() : super();
  factory ExchangeKeysRequest({
    $core.String? username,
    $core.String? publicKey,
    $core.String? address,
    $core.String? publicEncryptionKey,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (address != null) {
      _result.address = address;
    }
    if (publicEncryptionKey != null) {
      _result.publicEncryptionKey = publicEncryptionKey;
    }
    return _result;
  }
  factory ExchangeKeysRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeKeysRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExchangeKeysRequest clone() => ExchangeKeysRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExchangeKeysRequest copyWith(void Function(ExchangeKeysRequest) updates) => super.copyWith((message) => updates(message as ExchangeKeysRequest)) as ExchangeKeysRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExchangeKeysRequest create() => ExchangeKeysRequest._();
  ExchangeKeysRequest createEmptyInstance() => create();
  static $pb.PbList<ExchangeKeysRequest> createRepeated() => $pb.PbList<ExchangeKeysRequest>();
  @$core.pragma('dart2js:noInline')
  static ExchangeKeysRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeKeysRequest>(create);
  static ExchangeKeysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get publicEncryptionKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set publicEncryptionKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPublicEncryptionKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicEncryptionKey() => clearField(4);
}

class ExchangeKeysResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExchangeKeysResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicEncryptionKey')
    ..hasRequiredFields = false
  ;

  ExchangeKeysResponse._() : super();
  factory ExchangeKeysResponse({
    $core.String? username,
    $core.String? publicKey,
    $core.String? address,
    $core.String? publicEncryptionKey,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (address != null) {
      _result.address = address;
    }
    if (publicEncryptionKey != null) {
      _result.publicEncryptionKey = publicEncryptionKey;
    }
    return _result;
  }
  factory ExchangeKeysResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeKeysResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExchangeKeysResponse clone() => ExchangeKeysResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExchangeKeysResponse copyWith(void Function(ExchangeKeysResponse) updates) => super.copyWith((message) => updates(message as ExchangeKeysResponse)) as ExchangeKeysResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExchangeKeysResponse create() => ExchangeKeysResponse._();
  ExchangeKeysResponse createEmptyInstance() => create();
  static $pb.PbList<ExchangeKeysResponse> createRepeated() => $pb.PbList<ExchangeKeysResponse>();
  @$core.pragma('dart2js:noInline')
  static ExchangeKeysResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeKeysResponse>(create);
  static ExchangeKeysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get publicEncryptionKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set publicEncryptionKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPublicEncryptionKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicEncryptionKey() => clearField(4);
}

