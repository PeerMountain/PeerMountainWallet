///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/submit-attestation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SubmitAttestationDataRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubmitAttestationDataRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftType', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customerAddress')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  SubmitAttestationDataRequest._() : super();
  factory SubmitAttestationDataRequest({
    $core.int? nftType,
    $core.String? customerAddress,
    $core.String? data,
  }) {
    final _result = create();
    if (nftType != null) {
      _result.nftType = nftType;
    }
    if (customerAddress != null) {
      _result.customerAddress = customerAddress;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory SubmitAttestationDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitAttestationDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitAttestationDataRequest clone() => SubmitAttestationDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitAttestationDataRequest copyWith(void Function(SubmitAttestationDataRequest) updates) => super.copyWith((message) => updates(message as SubmitAttestationDataRequest)) as SubmitAttestationDataRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubmitAttestationDataRequest create() => SubmitAttestationDataRequest._();
  SubmitAttestationDataRequest createEmptyInstance() => create();
  static $pb.PbList<SubmitAttestationDataRequest> createRepeated() => $pb.PbList<SubmitAttestationDataRequest>();
  @$core.pragma('dart2js:noInline')
  static SubmitAttestationDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitAttestationDataRequest>(create);
  static SubmitAttestationDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nftType => $_getIZ(0);
  @$pb.TagNumber(1)
  set nftType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNftType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get customerAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set customerAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCustomerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearCustomerAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class SubmitAttestationDataResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubmitAttestationDataResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftType', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customerAddress')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  SubmitAttestationDataResponse._() : super();
  factory SubmitAttestationDataResponse({
    $core.int? nftType,
    $core.String? customerAddress,
    $core.String? data,
  }) {
    final _result = create();
    if (nftType != null) {
      _result.nftType = nftType;
    }
    if (customerAddress != null) {
      _result.customerAddress = customerAddress;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory SubmitAttestationDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitAttestationDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitAttestationDataResponse clone() => SubmitAttestationDataResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitAttestationDataResponse copyWith(void Function(SubmitAttestationDataResponse) updates) => super.copyWith((message) => updates(message as SubmitAttestationDataResponse)) as SubmitAttestationDataResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubmitAttestationDataResponse create() => SubmitAttestationDataResponse._();
  SubmitAttestationDataResponse createEmptyInstance() => create();
  static $pb.PbList<SubmitAttestationDataResponse> createRepeated() => $pb.PbList<SubmitAttestationDataResponse>();
  @$core.pragma('dart2js:noInline')
  static SubmitAttestationDataResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitAttestationDataResponse>(create);
  static SubmitAttestationDataResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nftType => $_getIZ(0);
  @$pb.TagNumber(1)
  set nftType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNftType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get customerAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set customerAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCustomerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearCustomerAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

