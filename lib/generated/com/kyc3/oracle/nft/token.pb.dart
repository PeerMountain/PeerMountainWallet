///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/nft/token.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Token extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Token', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'holder')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenId')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftType')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenUri')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keys')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'settings')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'settingsHash')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  Token._() : super();
  factory Token({
    $core.String? holder,
    $fixnum.Int64? tokenId,
    $fixnum.Int64? nftType,
    $core.String? tokenUri,
    $core.String? keys,
    $core.String? settings,
    $core.String? settingsHash,
    $core.String? provider,
    $core.String? data,
  }) {
    final _result = create();
    if (holder != null) {
      _result.holder = holder;
    }
    if (tokenId != null) {
      _result.tokenId = tokenId;
    }
    if (nftType != null) {
      _result.nftType = nftType;
    }
    if (tokenUri != null) {
      _result.tokenUri = tokenUri;
    }
    if (keys != null) {
      _result.keys = keys;
    }
    if (settings != null) {
      _result.settings = settings;
    }
    if (settingsHash != null) {
      _result.settingsHash = settingsHash;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory Token.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Token.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Token clone() => Token()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Token copyWith(void Function(Token) updates) => super.copyWith((message) => updates(message as Token)) as Token; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Token create() => Token._();
  Token createEmptyInstance() => create();
  static $pb.PbList<Token> createRepeated() => $pb.PbList<Token>();
  @$core.pragma('dart2js:noInline')
  static Token getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Token>(create);
  static Token? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get holder => $_getSZ(0);
  @$pb.TagNumber(1)
  set holder($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHolder() => $_has(0);
  @$pb.TagNumber(1)
  void clearHolder() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get tokenId => $_getI64(1);
  @$pb.TagNumber(2)
  set tokenId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get nftType => $_getI64(2);
  @$pb.TagNumber(3)
  set nftType($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNftType() => $_has(2);
  @$pb.TagNumber(3)
  void clearNftType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tokenUri => $_getSZ(3);
  @$pb.TagNumber(4)
  set tokenUri($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokenUri() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenUri() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get keys => $_getSZ(4);
  @$pb.TagNumber(5)
  set keys($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasKeys() => $_has(4);
  @$pb.TagNumber(5)
  void clearKeys() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get settings => $_getSZ(5);
  @$pb.TagNumber(6)
  set settings($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSettings() => $_has(5);
  @$pb.TagNumber(6)
  void clearSettings() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get settingsHash => $_getSZ(6);
  @$pb.TagNumber(7)
  set settingsHash($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSettingsHash() => $_has(6);
  @$pb.TagNumber(7)
  void clearSettingsHash() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get provider => $_getSZ(7);
  @$pb.TagNumber(8)
  set provider($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasProvider() => $_has(7);
  @$pb.TagNumber(8)
  void clearProvider() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get data => $_getSZ(8);
  @$pb.TagNumber(9)
  set data($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasData() => $_has(8);
  @$pb.TagNumber(9)
  void clearData() => clearField(9);
}

