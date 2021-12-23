///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/request-attestation-data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../attestation/attestation-data.pb.dart' as $6;

class DataForAttestationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DataForAttestationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'apAddress')
    ..hasRequiredFields = false
  ;

  DataForAttestationRequest._() : super();
  factory DataForAttestationRequest({
    $core.String? apAddress,
  }) {
    final _result = create();
    if (apAddress != null) {
      _result.apAddress = apAddress;
    }
    return _result;
  }
  factory DataForAttestationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataForAttestationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DataForAttestationRequest clone() => DataForAttestationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DataForAttestationRequest copyWith(void Function(DataForAttestationRequest) updates) => super.copyWith((message) => updates(message as DataForAttestationRequest)) as DataForAttestationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataForAttestationRequest create() => DataForAttestationRequest._();
  DataForAttestationRequest createEmptyInstance() => create();
  static $pb.PbList<DataForAttestationRequest> createRepeated() => $pb.PbList<DataForAttestationRequest>();
  @$core.pragma('dart2js:noInline')
  static DataForAttestationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataForAttestationRequest>(create);
  static DataForAttestationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get apAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set apAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearApAddress() => clearField(1);
}

class DataForAttestationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DataForAttestationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..pc<$6.AttestationData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'list', $pb.PbFieldType.PM, subBuilder: $6.AttestationData.create)
    ..hasRequiredFields = false
  ;

  DataForAttestationResponse._() : super();
  factory DataForAttestationResponse({
    $core.Iterable<$6.AttestationData>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory DataForAttestationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DataForAttestationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DataForAttestationResponse clone() => DataForAttestationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DataForAttestationResponse copyWith(void Function(DataForAttestationResponse) updates) => super.copyWith((message) => updates(message as DataForAttestationResponse)) as DataForAttestationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataForAttestationResponse create() => DataForAttestationResponse._();
  DataForAttestationResponse createEmptyInstance() => create();
  static $pb.PbList<DataForAttestationResponse> createRepeated() => $pb.PbList<DataForAttestationResponse>();
  @$core.pragma('dart2js:noInline')
  static DataForAttestationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataForAttestationResponse>(create);
  static DataForAttestationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$6.AttestationData> get list => $_getList(0);
}

