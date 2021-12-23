///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/challenge-signed.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../payment/payment.pb.dart' as $7;

class ChallengeSignedRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChallengeSignedRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challenge')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedChallenge')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress')
    ..aOM<$7.Payment>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payment', subBuilder: $7.Payment.create)
    ..hasRequiredFields = false
  ;

  ChallengeSignedRequest._() : super();
  factory ChallengeSignedRequest({
    $core.String? challenge,
    $core.String? signedChallenge,
    $core.String? userAddress,
    $7.Payment? payment,
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
    if (payment != null) {
      _result.payment = payment;
    }
    return _result;
  }
  factory ChallengeSignedRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChallengeSignedRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChallengeSignedRequest clone() => ChallengeSignedRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChallengeSignedRequest copyWith(void Function(ChallengeSignedRequest) updates) => super.copyWith((message) => updates(message as ChallengeSignedRequest)) as ChallengeSignedRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeSignedRequest create() => ChallengeSignedRequest._();
  ChallengeSignedRequest createEmptyInstance() => create();
  static $pb.PbList<ChallengeSignedRequest> createRepeated() => $pb.PbList<ChallengeSignedRequest>();
  @$core.pragma('dart2js:noInline')
  static ChallengeSignedRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChallengeSignedRequest>(create);
  static ChallengeSignedRequest? _defaultInstance;

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
  $7.Payment get payment => $_getN(3);
  @$pb.TagNumber(4)
  set payment($7.Payment v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPayment() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayment() => clearField(4);
  @$pb.TagNumber(4)
  $7.Payment ensurePayment() => $_ensure(3);
}

class ChallengeSignedResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChallengeSignedResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'redirectUrl')
    ..hasRequiredFields = false
  ;

  ChallengeSignedResponse._() : super();
  factory ChallengeSignedResponse({
    $core.String? redirectUrl,
  }) {
    final _result = create();
    if (redirectUrl != null) {
      _result.redirectUrl = redirectUrl;
    }
    return _result;
  }
  factory ChallengeSignedResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChallengeSignedResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChallengeSignedResponse clone() => ChallengeSignedResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChallengeSignedResponse copyWith(void Function(ChallengeSignedResponse) updates) => super.copyWith((message) => updates(message as ChallengeSignedResponse)) as ChallengeSignedResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeSignedResponse create() => ChallengeSignedResponse._();
  ChallengeSignedResponse createEmptyInstance() => create();
  static $pb.PbList<ChallengeSignedResponse> createRepeated() => $pb.PbList<ChallengeSignedResponse>();
  @$core.pragma('dart2js:noInline')
  static ChallengeSignedResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChallengeSignedResponse>(create);
  static ChallengeSignedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get redirectUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set redirectUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRedirectUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearRedirectUrl() => clearField(1);
}

