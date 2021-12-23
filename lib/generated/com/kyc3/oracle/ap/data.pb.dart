///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'attestation-provider.pb.dart' as $4;

class AttestationProviderDataRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttestationProviderDataRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  AttestationProviderDataRequest._() : super();
  factory AttestationProviderDataRequest({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory AttestationProviderDataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttestationProviderDataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttestationProviderDataRequest clone() => AttestationProviderDataRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttestationProviderDataRequest copyWith(void Function(AttestationProviderDataRequest) updates) => super.copyWith((message) => updates(message as AttestationProviderDataRequest)) as AttestationProviderDataRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttestationProviderDataRequest create() => AttestationProviderDataRequest._();
  AttestationProviderDataRequest createEmptyInstance() => create();
  static $pb.PbList<AttestationProviderDataRequest> createRepeated() => $pb.PbList<AttestationProviderDataRequest>();
  @$core.pragma('dart2js:noInline')
  static AttestationProviderDataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttestationProviderDataRequest>(create);
  static AttestationProviderDataRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class AttestationProviderDataResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttestationProviderDataResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..aOM<$4.AttestationProvider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', subBuilder: $4.AttestationProvider.create)
    ..hasRequiredFields = false
  ;

  AttestationProviderDataResponse._() : super();
  factory AttestationProviderDataResponse({
    $4.AttestationProvider? provider,
  }) {
    final _result = create();
    if (provider != null) {
      _result.provider = provider;
    }
    return _result;
  }
  factory AttestationProviderDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttestationProviderDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttestationProviderDataResponse clone() => AttestationProviderDataResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttestationProviderDataResponse copyWith(void Function(AttestationProviderDataResponse) updates) => super.copyWith((message) => updates(message as AttestationProviderDataResponse)) as AttestationProviderDataResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttestationProviderDataResponse create() => AttestationProviderDataResponse._();
  AttestationProviderDataResponse createEmptyInstance() => create();
  static $pb.PbList<AttestationProviderDataResponse> createRepeated() => $pb.PbList<AttestationProviderDataResponse>();
  @$core.pragma('dart2js:noInline')
  static AttestationProviderDataResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttestationProviderDataResponse>(create);
  static AttestationProviderDataResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $4.AttestationProvider get provider => $_getN(0);
  @$pb.TagNumber(1)
  set provider($4.AttestationProvider v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => clearField(1);
  @$pb.TagNumber(1)
  $4.AttestationProvider ensureProvider() => $_ensure(0);
}

