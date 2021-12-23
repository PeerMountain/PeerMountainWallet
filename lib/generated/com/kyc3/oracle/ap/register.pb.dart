///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/register.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'attestation-provider.pb.dart' as $4;

class RegisterAttestationProviderRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterAttestationProviderRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..aOM<$4.AttestationProvider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', subBuilder: $4.AttestationProvider.create)
    ..hasRequiredFields = false
  ;

  RegisterAttestationProviderRequest._() : super();
  factory RegisterAttestationProviderRequest({
    $4.AttestationProvider? provider,
  }) {
    final _result = create();
    if (provider != null) {
      _result.provider = provider;
    }
    return _result;
  }
  factory RegisterAttestationProviderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterAttestationProviderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterAttestationProviderRequest clone() => RegisterAttestationProviderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterAttestationProviderRequest copyWith(void Function(RegisterAttestationProviderRequest) updates) => super.copyWith((message) => updates(message as RegisterAttestationProviderRequest)) as RegisterAttestationProviderRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterAttestationProviderRequest create() => RegisterAttestationProviderRequest._();
  RegisterAttestationProviderRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterAttestationProviderRequest> createRepeated() => $pb.PbList<RegisterAttestationProviderRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterAttestationProviderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterAttestationProviderRequest>(create);
  static RegisterAttestationProviderRequest? _defaultInstance;

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

class RegisterAttestationProviderResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterAttestationProviderResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  RegisterAttestationProviderResponse._() : super();
  factory RegisterAttestationProviderResponse() => create();
  factory RegisterAttestationProviderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterAttestationProviderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterAttestationProviderResponse clone() => RegisterAttestationProviderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterAttestationProviderResponse copyWith(void Function(RegisterAttestationProviderResponse) updates) => super.copyWith((message) => updates(message as RegisterAttestationProviderResponse)) as RegisterAttestationProviderResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterAttestationProviderResponse create() => RegisterAttestationProviderResponse._();
  RegisterAttestationProviderResponse createEmptyInstance() => create();
  static $pb.PbList<RegisterAttestationProviderResponse> createRepeated() => $pb.PbList<RegisterAttestationProviderResponse>();
  @$core.pragma('dart2js:noInline')
  static RegisterAttestationProviderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterAttestationProviderResponse>(create);
  static RegisterAttestationProviderResponse? _defaultInstance;
}

