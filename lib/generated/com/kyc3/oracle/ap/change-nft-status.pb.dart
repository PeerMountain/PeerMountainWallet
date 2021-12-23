///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/change-nft-status.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ChangeNftSettingsStatusRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChangeNftSettingsStatusRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'apAddress')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activate')
    ..hasRequiredFields = false
  ;

  ChangeNftSettingsStatusRequest._() : super();
  factory ChangeNftSettingsStatusRequest({
    $fixnum.Int64? nftId,
    $core.String? apAddress,
    $core.bool? activate,
  }) {
    final _result = create();
    if (nftId != null) {
      _result.nftId = nftId;
    }
    if (apAddress != null) {
      _result.apAddress = apAddress;
    }
    if (activate != null) {
      _result.activate = activate;
    }
    return _result;
  }
  factory ChangeNftSettingsStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeNftSettingsStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeNftSettingsStatusRequest clone() => ChangeNftSettingsStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeNftSettingsStatusRequest copyWith(void Function(ChangeNftSettingsStatusRequest) updates) => super.copyWith((message) => updates(message as ChangeNftSettingsStatusRequest)) as ChangeNftSettingsStatusRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangeNftSettingsStatusRequest create() => ChangeNftSettingsStatusRequest._();
  ChangeNftSettingsStatusRequest createEmptyInstance() => create();
  static $pb.PbList<ChangeNftSettingsStatusRequest> createRepeated() => $pb.PbList<ChangeNftSettingsStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangeNftSettingsStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeNftSettingsStatusRequest>(create);
  static ChangeNftSettingsStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nftId => $_getI64(0);
  @$pb.TagNumber(1)
  set nftId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get apAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set apAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearApAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get activate => $_getBF(2);
  @$pb.TagNumber(3)
  set activate($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasActivate() => $_has(2);
  @$pb.TagNumber(3)
  void clearActivate() => clearField(3);
}

class ChangeNftSettingsStatusResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChangeNftSettingsStatusResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ChangeNftSettingsStatusResponse._() : super();
  factory ChangeNftSettingsStatusResponse() => create();
  factory ChangeNftSettingsStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeNftSettingsStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeNftSettingsStatusResponse clone() => ChangeNftSettingsStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeNftSettingsStatusResponse copyWith(void Function(ChangeNftSettingsStatusResponse) updates) => super.copyWith((message) => updates(message as ChangeNftSettingsStatusResponse)) as ChangeNftSettingsStatusResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangeNftSettingsStatusResponse create() => ChangeNftSettingsStatusResponse._();
  ChangeNftSettingsStatusResponse createEmptyInstance() => create();
  static $pb.PbList<ChangeNftSettingsStatusResponse> createRepeated() => $pb.PbList<ChangeNftSettingsStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static ChangeNftSettingsStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeNftSettingsStatusResponse>(create);
  static ChangeNftSettingsStatusResponse? _defaultInstance;
}

