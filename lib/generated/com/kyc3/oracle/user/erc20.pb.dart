///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/erc20.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Erc20MintRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Erc20MintRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedTransaction')
    ..hasRequiredFields = false
  ;

  Erc20MintRequest._() : super();
  factory Erc20MintRequest({
    $core.String? signedTransaction,
  }) {
    final _result = create();
    if (signedTransaction != null) {
      _result.signedTransaction = signedTransaction;
    }
    return _result;
  }
  factory Erc20MintRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Erc20MintRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Erc20MintRequest clone() => Erc20MintRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Erc20MintRequest copyWith(void Function(Erc20MintRequest) updates) => super.copyWith((message) => updates(message as Erc20MintRequest)) as Erc20MintRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Erc20MintRequest create() => Erc20MintRequest._();
  Erc20MintRequest createEmptyInstance() => create();
  static $pb.PbList<Erc20MintRequest> createRepeated() => $pb.PbList<Erc20MintRequest>();
  @$core.pragma('dart2js:noInline')
  static Erc20MintRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Erc20MintRequest>(create);
  static Erc20MintRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signedTransaction => $_getSZ(0);
  @$pb.TagNumber(1)
  set signedTransaction($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignedTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedTransaction() => clearField(1);
}

class Erc20MintResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Erc20MintResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionHash')
    ..hasRequiredFields = false
  ;

  Erc20MintResponse._() : super();
  factory Erc20MintResponse({
    $core.String? transactionHash,
  }) {
    final _result = create();
    if (transactionHash != null) {
      _result.transactionHash = transactionHash;
    }
    return _result;
  }
  factory Erc20MintResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Erc20MintResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Erc20MintResponse clone() => Erc20MintResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Erc20MintResponse copyWith(void Function(Erc20MintResponse) updates) => super.copyWith((message) => updates(message as Erc20MintResponse)) as Erc20MintResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Erc20MintResponse create() => Erc20MintResponse._();
  Erc20MintResponse createEmptyInstance() => create();
  static $pb.PbList<Erc20MintResponse> createRepeated() => $pb.PbList<Erc20MintResponse>();
  @$core.pragma('dart2js:noInline')
  static Erc20MintResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Erc20MintResponse>(create);
  static Erc20MintResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transactionHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionHash() => clearField(1);
}

class Erc20ApproveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Erc20ApproveRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedTransaction')
    ..hasRequiredFields = false
  ;

  Erc20ApproveRequest._() : super();
  factory Erc20ApproveRequest({
    $core.String? signedTransaction,
  }) {
    final _result = create();
    if (signedTransaction != null) {
      _result.signedTransaction = signedTransaction;
    }
    return _result;
  }
  factory Erc20ApproveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Erc20ApproveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Erc20ApproveRequest clone() => Erc20ApproveRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Erc20ApproveRequest copyWith(void Function(Erc20ApproveRequest) updates) => super.copyWith((message) => updates(message as Erc20ApproveRequest)) as Erc20ApproveRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Erc20ApproveRequest create() => Erc20ApproveRequest._();
  Erc20ApproveRequest createEmptyInstance() => create();
  static $pb.PbList<Erc20ApproveRequest> createRepeated() => $pb.PbList<Erc20ApproveRequest>();
  @$core.pragma('dart2js:noInline')
  static Erc20ApproveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Erc20ApproveRequest>(create);
  static Erc20ApproveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signedTransaction => $_getSZ(0);
  @$pb.TagNumber(1)
  set signedTransaction($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignedTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedTransaction() => clearField(1);
}

class Erc20ApproveResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Erc20ApproveResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionHash')
    ..hasRequiredFields = false
  ;

  Erc20ApproveResponse._() : super();
  factory Erc20ApproveResponse({
    $core.String? transactionHash,
  }) {
    final _result = create();
    if (transactionHash != null) {
      _result.transactionHash = transactionHash;
    }
    return _result;
  }
  factory Erc20ApproveResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Erc20ApproveResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Erc20ApproveResponse clone() => Erc20ApproveResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Erc20ApproveResponse copyWith(void Function(Erc20ApproveResponse) updates) => super.copyWith((message) => updates(message as Erc20ApproveResponse)) as Erc20ApproveResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Erc20ApproveResponse create() => Erc20ApproveResponse._();
  Erc20ApproveResponse createEmptyInstance() => create();
  static $pb.PbList<Erc20ApproveResponse> createRepeated() => $pb.PbList<Erc20ApproveResponse>();
  @$core.pragma('dart2js:noInline')
  static Erc20ApproveResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Erc20ApproveResponse>(create);
  static Erc20ApproveResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transactionHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionHash() => clearField(1);
}

