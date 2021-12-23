///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/attestation/attestation-data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class AttestationData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttestationData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.attestation'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customerAddress')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hashKeyArray')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenUri')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hashedData')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftType', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  AttestationData._() : super();
  factory AttestationData({
    $fixnum.Int64? id,
    $core.String? customerAddress,
    $core.String? data,
    $core.String? hashKeyArray,
    $core.String? tokenUri,
    $core.String? hashedData,
    $core.int? nftType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (customerAddress != null) {
      _result.customerAddress = customerAddress;
    }
    if (data != null) {
      _result.data = data;
    }
    if (hashKeyArray != null) {
      _result.hashKeyArray = hashKeyArray;
    }
    if (tokenUri != null) {
      _result.tokenUri = tokenUri;
    }
    if (hashedData != null) {
      _result.hashedData = hashedData;
    }
    if (nftType != null) {
      _result.nftType = nftType;
    }
    return _result;
  }
  factory AttestationData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttestationData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttestationData clone() => AttestationData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttestationData copyWith(void Function(AttestationData) updates) => super.copyWith((message) => updates(message as AttestationData)) as AttestationData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttestationData create() => AttestationData._();
  AttestationData createEmptyInstance() => create();
  static $pb.PbList<AttestationData> createRepeated() => $pb.PbList<AttestationData>();
  @$core.pragma('dart2js:noInline')
  static AttestationData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttestationData>(create);
  static AttestationData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get customerAddress => $_getSZ(1);
  @$pb.TagNumber(3)
  set customerAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasCustomerAddress() => $_has(1);
  @$pb.TagNumber(3)
  void clearCustomerAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(4)
  set data($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get hashKeyArray => $_getSZ(3);
  @$pb.TagNumber(5)
  set hashKeyArray($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasHashKeyArray() => $_has(3);
  @$pb.TagNumber(5)
  void clearHashKeyArray() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get tokenUri => $_getSZ(4);
  @$pb.TagNumber(6)
  set tokenUri($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasTokenUri() => $_has(4);
  @$pb.TagNumber(6)
  void clearTokenUri() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get hashedData => $_getSZ(5);
  @$pb.TagNumber(7)
  set hashedData($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasHashedData() => $_has(5);
  @$pb.TagNumber(7)
  void clearHashedData() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get nftType => $_getIZ(6);
  @$pb.TagNumber(8)
  set nftType($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasNftType() => $_has(6);
  @$pb.TagNumber(8)
  void clearNftType() => clearField(8);
}

class SignedAttestationData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignedAttestationData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.attestation'), createEmptyInstance: create)
    ..aOM<AttestationData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestation', subBuilder: AttestationData.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedMessage')
    ..hasRequiredFields = false
  ;

  SignedAttestationData._() : super();
  factory SignedAttestationData({
    AttestationData? attestation,
    $core.String? signedMessage,
  }) {
    final _result = create();
    if (attestation != null) {
      _result.attestation = attestation;
    }
    if (signedMessage != null) {
      _result.signedMessage = signedMessage;
    }
    return _result;
  }
  factory SignedAttestationData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedAttestationData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedAttestationData clone() => SignedAttestationData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedAttestationData copyWith(void Function(SignedAttestationData) updates) => super.copyWith((message) => updates(message as SignedAttestationData)) as SignedAttestationData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignedAttestationData create() => SignedAttestationData._();
  SignedAttestationData createEmptyInstance() => create();
  static $pb.PbList<SignedAttestationData> createRepeated() => $pb.PbList<SignedAttestationData>();
  @$core.pragma('dart2js:noInline')
  static SignedAttestationData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedAttestationData>(create);
  static SignedAttestationData? _defaultInstance;

  @$pb.TagNumber(1)
  AttestationData get attestation => $_getN(0);
  @$pb.TagNumber(1)
  set attestation(AttestationData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAttestation() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttestation() => clearField(1);
  @$pb.TagNumber(1)
  AttestationData ensureAttestation() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get signedMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set signedMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignedMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedMessage() => clearField(2);
}

