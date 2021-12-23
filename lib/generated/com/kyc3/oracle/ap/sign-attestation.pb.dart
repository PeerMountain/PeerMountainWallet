///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/sign-attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SignAttestationDataRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignAttestationDataRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestationDataId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedMessage')
    ..hasRequiredFields = false
  ;

  SignAttestationDataRequest._() : super();
  factory SignAttestationDataRequest({
    $fixnum.Int64? attestationDataId,
    $core.String? signedMessage,
  }) {
    final _result = create();
    if (attestationDataId != null) {
      _result.attestationDataId = attestationDataId;
    }
    if (signedMessage != null) {
      _result.signedMessage = signedMessage;
    }
    return _result;
  }
  factory SignAttestationDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignAttestationDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignAttestationDataRequest clone() => SignAttestationDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignAttestationDataRequest copyWith(void Function(SignAttestationDataRequest) updates) => super.copyWith((message) => updates(message as SignAttestationDataRequest)) as SignAttestationDataRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignAttestationDataRequest create() => SignAttestationDataRequest._();
  SignAttestationDataRequest createEmptyInstance() => create();
  static $pb.PbList<SignAttestationDataRequest> createRepeated() => $pb.PbList<SignAttestationDataRequest>();
  @$core.pragma('dart2js:noInline')
  static SignAttestationDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignAttestationDataRequest>(create);
  static SignAttestationDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get attestationDataId => $_getI64(0);
  @$pb.TagNumber(1)
  set attestationDataId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAttestationDataId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttestationDataId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get signedMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set signedMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignedMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedMessage() => clearField(2);
}

class SignAttestationDataResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignAttestationDataResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SignAttestationDataResponse._() : super();
  factory SignAttestationDataResponse() => create();
  factory SignAttestationDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignAttestationDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignAttestationDataResponse clone() => SignAttestationDataResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignAttestationDataResponse copyWith(void Function(SignAttestationDataResponse) updates) => super.copyWith((message) => updates(message as SignAttestationDataResponse)) as SignAttestationDataResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignAttestationDataResponse create() => SignAttestationDataResponse._();
  SignAttestationDataResponse createEmptyInstance() => create();
  static $pb.PbList<SignAttestationDataResponse> createRepeated() => $pb.PbList<SignAttestationDataResponse>();
  @$core.pragma('dart2js:noInline')
  static SignAttestationDataResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignAttestationDataResponse>(create);
  static SignAttestationDataResponse? _defaultInstance;
}

