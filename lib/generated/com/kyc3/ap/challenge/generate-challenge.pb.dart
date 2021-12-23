///
//  Generated code. Do not modify.
//  source: com/kyc3/ap/challenge/generate-challenge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'challenge.pb.dart' as $0;

class GenerateChallengeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenerateChallengeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.ap.challenge'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPublicKey')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftType', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GenerateChallengeRequest._() : super();
  factory GenerateChallengeRequest({
    $core.String? userAddress,
    $core.String? userPublicKey,
    $core.int? nftType,
  }) {
    final _result = create();
    if (userAddress != null) {
      _result.userAddress = userAddress;
    }
    if (userPublicKey != null) {
      _result.userPublicKey = userPublicKey;
    }
    if (nftType != null) {
      _result.nftType = nftType;
    }
    return _result;
  }
  factory GenerateChallengeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateChallengeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateChallengeRequest clone() => GenerateChallengeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateChallengeRequest copyWith(void Function(GenerateChallengeRequest) updates) => super.copyWith((message) => updates(message as GenerateChallengeRequest)) as GenerateChallengeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenerateChallengeRequest create() => GenerateChallengeRequest._();
  GenerateChallengeRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateChallengeRequest> createRepeated() => $pb.PbList<GenerateChallengeRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateChallengeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateChallengeRequest>(create);
  static GenerateChallengeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set userAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userPublicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set userPublicKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserPublicKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get nftType => $_getIZ(2);
  @$pb.TagNumber(3)
  set nftType($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNftType() => $_has(2);
  @$pb.TagNumber(3)
  void clearNftType() => clearField(3);
}

class GenerateChallengeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenerateChallengeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.ap.challenge'), createEmptyInstance: create)
    ..aOM<$0.Challenge>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challenge', subBuilder: $0.Challenge.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPublicKey')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftType', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GenerateChallengeResponse._() : super();
  factory GenerateChallengeResponse({
    $0.Challenge? challenge,
    $core.String? userAddress,
    $core.String? userPublicKey,
    $core.int? nftType,
  }) {
    final _result = create();
    if (challenge != null) {
      _result.challenge = challenge;
    }
    if (userAddress != null) {
      _result.userAddress = userAddress;
    }
    if (userPublicKey != null) {
      _result.userPublicKey = userPublicKey;
    }
    if (nftType != null) {
      _result.nftType = nftType;
    }
    return _result;
  }
  factory GenerateChallengeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateChallengeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateChallengeResponse clone() => GenerateChallengeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateChallengeResponse copyWith(void Function(GenerateChallengeResponse) updates) => super.copyWith((message) => updates(message as GenerateChallengeResponse)) as GenerateChallengeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenerateChallengeResponse create() => GenerateChallengeResponse._();
  GenerateChallengeResponse createEmptyInstance() => create();
  static $pb.PbList<GenerateChallengeResponse> createRepeated() => $pb.PbList<GenerateChallengeResponse>();
  @$core.pragma('dart2js:noInline')
  static GenerateChallengeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateChallengeResponse>(create);
  static GenerateChallengeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Challenge get challenge => $_getN(0);
  @$pb.TagNumber(1)
  set challenge($0.Challenge v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChallenge() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallenge() => clearField(1);
  @$pb.TagNumber(1)
  $0.Challenge ensureChallenge() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get userAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set userAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userPublicKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set userPublicKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserPublicKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get nftType => $_getIZ(3);
  @$pb.TagNumber(4)
  set nftType($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNftType() => $_has(3);
  @$pb.TagNumber(4)
  void clearNftType() => clearField(4);
}

