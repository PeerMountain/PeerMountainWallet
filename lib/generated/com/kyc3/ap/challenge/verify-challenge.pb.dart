///
//  Generated code. Do not modify.
//  source: com/kyc3/ap/challenge/verify-challenge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class VerifyChallengeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyChallengeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.ap.challenge'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challenge')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedChallenge')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPublicKey')
    ..hasRequiredFields = false
  ;

  VerifyChallengeRequest._() : super();
  factory VerifyChallengeRequest({
    $core.String? challenge,
    $core.String? signedChallenge,
    $core.String? userAddress,
    $core.String? userPublicKey,
  }) {
    final _result = create();
    if (challenge != null) {
      _result.challenge = challenge;
    }
    if (signedChallenge != null) {
      _result.signedChallenge = signedChallenge;
    }
    if (userAddress != null) {
      _result.userAddress = userAddress;
    }
    if (userPublicKey != null) {
      _result.userPublicKey = userPublicKey;
    }
    return _result;
  }
  factory VerifyChallengeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyChallengeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyChallengeRequest clone() => VerifyChallengeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyChallengeRequest copyWith(void Function(VerifyChallengeRequest) updates) => super.copyWith((message) => updates(message as VerifyChallengeRequest)) as VerifyChallengeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyChallengeRequest create() => VerifyChallengeRequest._();
  VerifyChallengeRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyChallengeRequest> createRepeated() => $pb.PbList<VerifyChallengeRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyChallengeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyChallengeRequest>(create);
  static VerifyChallengeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get challenge => $_getSZ(0);
  @$pb.TagNumber(1)
  set challenge($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChallenge() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallenge() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get signedChallenge => $_getSZ(1);
  @$pb.TagNumber(2)
  set signedChallenge($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignedChallenge() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedChallenge() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set userAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userPublicKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set userPublicKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserPublicKey() => clearField(4);
}

class VerifyChallengeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyChallengeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.ap.challenge'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPublicKey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'redirectUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress')
    ..hasRequiredFields = false
  ;

  VerifyChallengeResponse._() : super();
  factory VerifyChallengeResponse({
    $core.String? userPublicKey,
    $core.String? redirectUrl,
    $core.String? userAddress,
  }) {
    final _result = create();
    if (userPublicKey != null) {
      _result.userPublicKey = userPublicKey;
    }
    if (redirectUrl != null) {
      _result.redirectUrl = redirectUrl;
    }
    if (userAddress != null) {
      _result.userAddress = userAddress;
    }
    return _result;
  }
  factory VerifyChallengeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyChallengeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyChallengeResponse clone() => VerifyChallengeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyChallengeResponse copyWith(void Function(VerifyChallengeResponse) updates) => super.copyWith((message) => updates(message as VerifyChallengeResponse)) as VerifyChallengeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyChallengeResponse create() => VerifyChallengeResponse._();
  VerifyChallengeResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyChallengeResponse> createRepeated() => $pb.PbList<VerifyChallengeResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyChallengeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyChallengeResponse>(create);
  static VerifyChallengeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userPublicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set userPublicKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get redirectUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set redirectUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRedirectUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearRedirectUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set userAddress($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserAddress() => clearField(3);
}

