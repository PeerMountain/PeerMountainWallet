///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/nft-mint.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../nft/token.pb.dart' as $9;

class NftMintRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NftMintRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  NftMintRequest._() : super();
  factory NftMintRequest({
    $core.String? message,
    $core.String? signature,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    return _result;
  }
  factory NftMintRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NftMintRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NftMintRequest clone() => NftMintRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NftMintRequest copyWith(void Function(NftMintRequest) updates) => super.copyWith((message) => updates(message as NftMintRequest)) as NftMintRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NftMintRequest create() => NftMintRequest._();
  NftMintRequest createEmptyInstance() => create();
  static $pb.PbList<NftMintRequest> createRepeated() => $pb.PbList<NftMintRequest>();
  @$core.pragma('dart2js:noInline')
  static NftMintRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NftMintRequest>(create);
  static NftMintRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get signature => $_getSZ(1);
  @$pb.TagNumber(2)
  set signature($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);
}

class NftMintResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NftMintResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftMintTransactionHash')
    ..aOM<$9.Token>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token', subBuilder: $9.Token.create)
    ..hasRequiredFields = false
  ;

  NftMintResponse._() : super();
  factory NftMintResponse({
    $core.String? nftMintTransactionHash,
    $9.Token? token,
  }) {
    final _result = create();
    if (nftMintTransactionHash != null) {
      _result.nftMintTransactionHash = nftMintTransactionHash;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory NftMintResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NftMintResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NftMintResponse clone() => NftMintResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NftMintResponse copyWith(void Function(NftMintResponse) updates) => super.copyWith((message) => updates(message as NftMintResponse)) as NftMintResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NftMintResponse create() => NftMintResponse._();
  NftMintResponse createEmptyInstance() => create();
  static $pb.PbList<NftMintResponse> createRepeated() => $pb.PbList<NftMintResponse>();
  @$core.pragma('dart2js:noInline')
  static NftMintResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NftMintResponse>(create);
  static NftMintResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nftMintTransactionHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set nftMintTransactionHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNftMintTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftMintTransactionHash() => clearField(1);

  @$pb.TagNumber(2)
  $9.Token get token => $_getN(1);
  @$pb.TagNumber(2)
  set token($9.Token v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
  @$pb.TagNumber(2)
  $9.Token ensureToken() => $_ensure(1);
}

