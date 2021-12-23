///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/login-challenge.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LoginChallengeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginChallengeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  LoginChallengeRequest._() : super();
  factory LoginChallengeRequest({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory LoginChallengeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginChallengeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginChallengeRequest clone() => LoginChallengeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginChallengeRequest copyWith(void Function(LoginChallengeRequest) updates) => super.copyWith((message) => updates(message as LoginChallengeRequest)) as LoginChallengeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginChallengeRequest create() => LoginChallengeRequest._();
  LoginChallengeRequest createEmptyInstance() => create();
  static $pb.PbList<LoginChallengeRequest> createRepeated() => $pb.PbList<LoginChallengeRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginChallengeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginChallengeRequest>(create);
  static LoginChallengeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class LoginChallengeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginChallengeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challenge')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'registered')
    ..hasRequiredFields = false
  ;

  LoginChallengeResponse._() : super();
  factory LoginChallengeResponse({
    $core.String? address,
    $core.String? challenge,
    $core.bool? registered,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (challenge != null) {
      _result.challenge = challenge;
    }
    if (registered != null) {
      _result.registered = registered;
    }
    return _result;
  }
  factory LoginChallengeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginChallengeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginChallengeResponse clone() => LoginChallengeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginChallengeResponse copyWith(void Function(LoginChallengeResponse) updates) => super.copyWith((message) => updates(message as LoginChallengeResponse)) as LoginChallengeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginChallengeResponse create() => LoginChallengeResponse._();
  LoginChallengeResponse createEmptyInstance() => create();
  static $pb.PbList<LoginChallengeResponse> createRepeated() => $pb.PbList<LoginChallengeResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginChallengeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginChallengeResponse>(create);
  static LoginChallengeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get challenge => $_getSZ(1);
  @$pb.TagNumber(2)
  set challenge($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChallenge() => $_has(1);
  @$pb.TagNumber(2)
  void clearChallenge() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get registered => $_getBF(2);
  @$pb.TagNumber(3)
  set registered($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRegistered() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegistered() => clearField(3);
}

