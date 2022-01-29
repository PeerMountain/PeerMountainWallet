///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/nft-transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NftTransferRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NftTransferRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  NftTransferRequest._() : super();
  factory NftTransferRequest({
    $core.String? message,
    $core.String? signature,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    return _result;
  }
  factory NftTransferRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NftTransferRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NftTransferRequest clone() => NftTransferRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NftTransferRequest copyWith(void Function(NftTransferRequest) updates) => super.copyWith((message) => updates(message as NftTransferRequest)) as NftTransferRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NftTransferRequest create() => NftTransferRequest._();
  NftTransferRequest createEmptyInstance() => create();
  static $pb.PbList<NftTransferRequest> createRepeated() => $pb.PbList<NftTransferRequest>();
  @$core.pragma('dart2js:noInline')
  static NftTransferRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NftTransferRequest>(create);
  static NftTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get signature => $_getSZ(1);
  @$pb.TagNumber(2)
  set signature($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);
}

class NftTransferResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NftTransferResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionHash')
    ..hasRequiredFields = false
  ;

  NftTransferResponse._() : super();
  factory NftTransferResponse({
    $core.String? transactionHash,
  }) {
    final _result = create();
    if (transactionHash != null) {
      _result.transactionHash = transactionHash;
    }
    return _result;
  }
  factory NftTransferResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NftTransferResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NftTransferResponse clone() => NftTransferResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NftTransferResponse copyWith(void Function(NftTransferResponse) updates) => super.copyWith((message) => updates(message as NftTransferResponse)) as NftTransferResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NftTransferResponse create() => NftTransferResponse._();
  NftTransferResponse createEmptyInstance() => create();
  static $pb.PbList<NftTransferResponse> createRepeated() => $pb.PbList<NftTransferResponse>();
  @$core.pragma('dart2js:noInline')
  static NftTransferResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NftTransferResponse>(create);
  static NftTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transactionHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionHash() => clearField(1);
}

