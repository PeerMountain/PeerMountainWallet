///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/create-nft.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../nft/nft.pb.dart' as $3;

class CreateNftRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateNftRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..aOM<$3.NftSettings>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftSettings', subBuilder: $3.NftSettings.create)
    ..hasRequiredFields = false
  ;

  CreateNftRequest._() : super();
  factory CreateNftRequest({
    $3.NftSettings? nftSettings,
  }) {
    final _result = create();
    if (nftSettings != null) {
      _result.nftSettings = nftSettings;
    }
    return _result;
  }
  factory CreateNftRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateNftRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateNftRequest clone() => CreateNftRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateNftRequest copyWith(void Function(CreateNftRequest) updates) => super.copyWith((message) => updates(message as CreateNftRequest)) as CreateNftRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateNftRequest create() => CreateNftRequest._();
  CreateNftRequest createEmptyInstance() => create();
  static $pb.PbList<CreateNftRequest> createRepeated() => $pb.PbList<CreateNftRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateNftRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateNftRequest>(create);
  static CreateNftRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $3.NftSettings get nftSettings => $_getN(0);
  @$pb.TagNumber(1)
  set nftSettings($3.NftSettings v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNftSettings() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftSettings() => clearField(1);
  @$pb.TagNumber(1)
  $3.NftSettings ensureNftSettings() => $_ensure(0);
}

class CreateNftResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateNftResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..pc<$3.NftSettings>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftSettingsList', $pb.PbFieldType.PM, subBuilder: $3.NftSettings.create)
    ..hasRequiredFields = false
  ;

  CreateNftResponse._() : super();
  factory CreateNftResponse({
    $core.Iterable<$3.NftSettings>? nftSettingsList,
  }) {
    final _result = create();
    if (nftSettingsList != null) {
      _result.nftSettingsList.addAll(nftSettingsList);
    }
    return _result;
  }
  factory CreateNftResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateNftResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateNftResponse clone() => CreateNftResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateNftResponse copyWith(void Function(CreateNftResponse) updates) => super.copyWith((message) => updates(message as CreateNftResponse)) as CreateNftResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateNftResponse create() => CreateNftResponse._();
  CreateNftResponse createEmptyInstance() => create();
  static $pb.PbList<CreateNftResponse> createRepeated() => $pb.PbList<CreateNftResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateNftResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateNftResponse>(create);
  static CreateNftResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.NftSettings> get nftSettingsList => $_getList(0);
}

