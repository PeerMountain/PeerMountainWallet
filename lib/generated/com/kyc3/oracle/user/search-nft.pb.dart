///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/search-nft.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../nft/signed-nft.pb.dart' as $5;

class SearchNftRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchNftRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keywords')
    ..hasRequiredFields = false
  ;

  SearchNftRequest._() : super();
  factory SearchNftRequest({
    $core.String? keywords,
  }) {
    final _result = create();
    if (keywords != null) {
      _result.keywords = keywords;
    }
    return _result;
  }
  factory SearchNftRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchNftRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchNftRequest clone() => SearchNftRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchNftRequest copyWith(void Function(SearchNftRequest) updates) => super.copyWith((message) => updates(message as SearchNftRequest)) as SearchNftRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchNftRequest create() => SearchNftRequest._();
  SearchNftRequest createEmptyInstance() => create();
  static $pb.PbList<SearchNftRequest> createRepeated() => $pb.PbList<SearchNftRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchNftRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchNftRequest>(create);
  static SearchNftRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keywords => $_getSZ(0);
  @$pb.TagNumber(1)
  set keywords($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKeywords() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeywords() => clearField(1);
}

class SearchNftResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchNftResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..pc<$5.SignedNftSettings>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftSettingsList', $pb.PbFieldType.PM, subBuilder: $5.SignedNftSettings.create)
    ..hasRequiredFields = false
  ;

  SearchNftResponse._() : super();
  factory SearchNftResponse({
    $core.Iterable<$5.SignedNftSettings>? nftSettingsList,
  }) {
    final _result = create();
    if (nftSettingsList != null) {
      _result.nftSettingsList.addAll(nftSettingsList);
    }
    return _result;
  }
  factory SearchNftResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchNftResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchNftResponse clone() => SearchNftResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchNftResponse copyWith(void Function(SearchNftResponse) updates) => super.copyWith((message) => updates(message as SearchNftResponse)) as SearchNftResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchNftResponse create() => SearchNftResponse._();
  SearchNftResponse createEmptyInstance() => create();
  static $pb.PbList<SearchNftResponse> createRepeated() => $pb.PbList<SearchNftResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchNftResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchNftResponse>(create);
  static SearchNftResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$5.SignedNftSettings> get nftSettingsList => $_getList(0);
}

