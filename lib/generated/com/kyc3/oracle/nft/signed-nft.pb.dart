///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/nft/signed-nft.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'nft.pb.dart' as $3;

class SignedNftSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignedNftSettings', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.nft'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<$3.NftSettings>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nft', subBuilder: $3.NftSettings.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  SignedNftSettings._() : super();
  factory SignedNftSettings({
    $fixnum.Int64? id,
    $3.NftSettings? nft,
    $core.bool? status,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (nft != null) {
      _result.nft = nft;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory SignedNftSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedNftSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedNftSettings clone() => SignedNftSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedNftSettings copyWith(void Function(SignedNftSettings) updates) => super.copyWith((message) => updates(message as SignedNftSettings)) as SignedNftSettings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignedNftSettings create() => SignedNftSettings._();
  SignedNftSettings createEmptyInstance() => create();
  static $pb.PbList<SignedNftSettings> createRepeated() => $pb.PbList<SignedNftSettings>();
  @$core.pragma('dart2js:noInline')
  static SignedNftSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedNftSettings>(create);
  static SignedNftSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $3.NftSettings get nft => $_getN(1);
  @$pb.TagNumber(2)
  set nft($3.NftSettings v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNft() => $_has(1);
  @$pb.TagNumber(2)
  void clearNft() => clearField(2);
  @$pb.TagNumber(2)
  $3.NftSettings ensureNft() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get status => $_getBF(2);
  @$pb.TagNumber(3)
  set status($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

