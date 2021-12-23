///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/ap-list.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../ap/attestation-provider.pb.dart' as $4;

class AttestationProviderListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttestationProviderListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  AttestationProviderListRequest._() : super();
  factory AttestationProviderListRequest() => create();
  factory AttestationProviderListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttestationProviderListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttestationProviderListRequest clone() => AttestationProviderListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttestationProviderListRequest copyWith(void Function(AttestationProviderListRequest) updates) => super.copyWith((message) => updates(message as AttestationProviderListRequest)) as AttestationProviderListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttestationProviderListRequest create() => AttestationProviderListRequest._();
  AttestationProviderListRequest createEmptyInstance() => create();
  static $pb.PbList<AttestationProviderListRequest> createRepeated() => $pb.PbList<AttestationProviderListRequest>();
  @$core.pragma('dart2js:noInline')
  static AttestationProviderListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttestationProviderListRequest>(create);
  static AttestationProviderListRequest? _defaultInstance;
}

class AttestationProviderListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttestationProviderListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..pc<$4.AttestationProvider>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'providers', $pb.PbFieldType.PM, subBuilder: $4.AttestationProvider.create)
    ..hasRequiredFields = false
  ;

  AttestationProviderListResponse._() : super();
  factory AttestationProviderListResponse({
    $core.Iterable<$4.AttestationProvider>? providers,
  }) {
    final _result = create();
    if (providers != null) {
      _result.providers.addAll(providers);
    }
    return _result;
  }
  factory AttestationProviderListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttestationProviderListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttestationProviderListResponse clone() => AttestationProviderListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttestationProviderListResponse copyWith(void Function(AttestationProviderListResponse) updates) => super.copyWith((message) => updates(message as AttestationProviderListResponse)) as AttestationProviderListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttestationProviderListResponse create() => AttestationProviderListResponse._();
  AttestationProviderListResponse createEmptyInstance() => create();
  static $pb.PbList<AttestationProviderListResponse> createRepeated() => $pb.PbList<AttestationProviderListResponse>();
  @$core.pragma('dart2js:noInline')
  static AttestationProviderListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttestationProviderListResponse>(create);
  static AttestationProviderListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$4.AttestationProvider> get providers => $_getList(0);
}

