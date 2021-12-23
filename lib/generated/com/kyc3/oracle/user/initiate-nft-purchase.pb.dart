///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/initiate-nft-purchase.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../payment/invoice.pb.dart' as $8;

class InitiateNFTPurchaseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InitiateNFTPurchaseRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftType', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress')
    ..hasRequiredFields = false
  ;

  InitiateNFTPurchaseRequest._() : super();
  factory InitiateNFTPurchaseRequest({
    $core.int? nftType,
    $core.String? userAddress,
  }) {
    final _result = create();
    if (nftType != null) {
      _result.nftType = nftType;
    }
    if (userAddress != null) {
      _result.userAddress = userAddress;
    }
    return _result;
  }
  factory InitiateNFTPurchaseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitiateNFTPurchaseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitiateNFTPurchaseRequest clone() => InitiateNFTPurchaseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitiateNFTPurchaseRequest copyWith(void Function(InitiateNFTPurchaseRequest) updates) => super.copyWith((message) => updates(message as InitiateNFTPurchaseRequest)) as InitiateNFTPurchaseRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitiateNFTPurchaseRequest create() => InitiateNFTPurchaseRequest._();
  InitiateNFTPurchaseRequest createEmptyInstance() => create();
  static $pb.PbList<InitiateNFTPurchaseRequest> createRepeated() => $pb.PbList<InitiateNFTPurchaseRequest>();
  @$core.pragma('dart2js:noInline')
  static InitiateNFTPurchaseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitiateNFTPurchaseRequest>(create);
  static InitiateNFTPurchaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nftType => $_getIZ(0);
  @$pb.TagNumber(1)
  set nftType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNftType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set userAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserAddress() => clearField(2);
}

class InitiateNFTPurchaseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InitiateNFTPurchaseResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftType', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challenge')
    ..aOM<$8.Invoice>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'invoice', subBuilder: $8.Invoice.create)
    ..hasRequiredFields = false
  ;

  InitiateNFTPurchaseResponse._() : super();
  factory InitiateNFTPurchaseResponse({
    $core.int? nftType,
    $core.String? userAddress,
    $core.String? challenge,
    $8.Invoice? invoice,
  }) {
    final _result = create();
    if (nftType != null) {
      _result.nftType = nftType;
    }
    if (userAddress != null) {
      _result.userAddress = userAddress;
    }
    if (challenge != null) {
      _result.challenge = challenge;
    }
    if (invoice != null) {
      _result.invoice = invoice;
    }
    return _result;
  }
  factory InitiateNFTPurchaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InitiateNFTPurchaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InitiateNFTPurchaseResponse clone() => InitiateNFTPurchaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InitiateNFTPurchaseResponse copyWith(void Function(InitiateNFTPurchaseResponse) updates) => super.copyWith((message) => updates(message as InitiateNFTPurchaseResponse)) as InitiateNFTPurchaseResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InitiateNFTPurchaseResponse create() => InitiateNFTPurchaseResponse._();
  InitiateNFTPurchaseResponse createEmptyInstance() => create();
  static $pb.PbList<InitiateNFTPurchaseResponse> createRepeated() => $pb.PbList<InitiateNFTPurchaseResponse>();
  @$core.pragma('dart2js:noInline')
  static InitiateNFTPurchaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InitiateNFTPurchaseResponse>(create);
  static InitiateNFTPurchaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nftType => $_getIZ(0);
  @$pb.TagNumber(1)
  set nftType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNftType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set userAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get challenge => $_getSZ(2);
  @$pb.TagNumber(3)
  set challenge($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChallenge() => $_has(2);
  @$pb.TagNumber(3)
  void clearChallenge() => clearField(3);

  @$pb.TagNumber(4)
  $8.Invoice get invoice => $_getN(3);
  @$pb.TagNumber(4)
  set invoice($8.Invoice v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasInvoice() => $_has(3);
  @$pb.TagNumber(4)
  void clearInvoice() => clearField(4);
  @$pb.TagNumber(4)
  $8.Invoice ensureInvoice() => $_ensure(3);
}

