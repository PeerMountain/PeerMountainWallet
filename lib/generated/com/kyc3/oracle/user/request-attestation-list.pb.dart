///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/request-attestation-list.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../attestation/attestation-data.pb.dart' as $6;

class AttestationDataListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttestationDataListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customerAddress')
    ..hasRequiredFields = false
  ;

  AttestationDataListRequest._() : super();
  factory AttestationDataListRequest({
    $core.String? customerAddress,
  }) {
    final _result = create();
    if (customerAddress != null) {
      _result.customerAddress = customerAddress;
    }
    return _result;
  }
  factory AttestationDataListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttestationDataListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttestationDataListRequest clone() => AttestationDataListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttestationDataListRequest copyWith(void Function(AttestationDataListRequest) updates) => super.copyWith((message) => updates(message as AttestationDataListRequest)) as AttestationDataListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttestationDataListRequest create() => AttestationDataListRequest._();
  AttestationDataListRequest createEmptyInstance() => create();
  static $pb.PbList<AttestationDataListRequest> createRepeated() => $pb.PbList<AttestationDataListRequest>();
  @$core.pragma('dart2js:noInline')
  static AttestationDataListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttestationDataListRequest>(create);
  static AttestationDataListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get customerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set customerAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustomerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomerAddress() => clearField(1);
}

class AttestationDataListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttestationDataListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..pc<$6.SignedAttestationData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userData', $pb.PbFieldType.PM, subBuilder: $6.SignedAttestationData.create)
    ..hasRequiredFields = false
  ;

  AttestationDataListResponse._() : super();
  factory AttestationDataListResponse({
    $core.Iterable<$6.SignedAttestationData>? userData,
  }) {
    final _result = create();
    if (userData != null) {
      _result.userData.addAll(userData);
    }
    return _result;
  }
  factory AttestationDataListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttestationDataListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttestationDataListResponse clone() => AttestationDataListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttestationDataListResponse copyWith(void Function(AttestationDataListResponse) updates) => super.copyWith((message) => updates(message as AttestationDataListResponse)) as AttestationDataListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttestationDataListResponse create() => AttestationDataListResponse._();
  AttestationDataListResponse createEmptyInstance() => create();
  static $pb.PbList<AttestationDataListResponse> createRepeated() => $pb.PbList<AttestationDataListResponse>();
  @$core.pragma('dart2js:noInline')
  static AttestationDataListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttestationDataListResponse>(create);
  static AttestationDataListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$6.SignedAttestationData> get userData => $_getList(0);
}

