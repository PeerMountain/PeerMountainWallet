///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/list-nft.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../nft/signed-nft.pb.dart' as $5;

class ListNftRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListNftRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListNftRequest._() : super();
  factory ListNftRequest() => create();
  factory ListNftRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNftRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNftRequest clone() => ListNftRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNftRequest copyWith(void Function(ListNftRequest) updates) => super.copyWith((message) => updates(message as ListNftRequest)) as ListNftRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListNftRequest create() => ListNftRequest._();
  ListNftRequest createEmptyInstance() => create();
  static $pb.PbList<ListNftRequest> createRepeated() => $pb.PbList<ListNftRequest>();
  @$core.pragma('dart2js:noInline')
  static ListNftRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNftRequest>(create);
  static ListNftRequest? _defaultInstance;
}

class ListNftResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListNftResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..pc<$5.SignedNftSettings>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftSettingsList', $pb.PbFieldType.PM, subBuilder: $5.SignedNftSettings.create)
    ..hasRequiredFields = false
  ;

  ListNftResponse._() : super();
  factory ListNftResponse({
    $core.Iterable<$5.SignedNftSettings>? nftSettingsList,
  }) {
    final _result = create();
    if (nftSettingsList != null) {
      _result.nftSettingsList.addAll(nftSettingsList);
    }
    return _result;
  }
  factory ListNftResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListNftResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListNftResponse clone() => ListNftResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListNftResponse copyWith(void Function(ListNftResponse) updates) => super.copyWith((message) => updates(message as ListNftResponse)) as ListNftResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListNftResponse create() => ListNftResponse._();
  ListNftResponse createEmptyInstance() => create();
  static $pb.PbList<ListNftResponse> createRepeated() => $pb.PbList<ListNftResponse>();
  @$core.pragma('dart2js:noInline')
  static ListNftResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListNftResponse>(create);
  static ListNftResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$5.SignedNftSettings> get nftSettingsList => $_getList(0);
}

