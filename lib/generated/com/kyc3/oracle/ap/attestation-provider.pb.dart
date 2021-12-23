///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/ap/attestation-provider.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AttestationProvider extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AttestationProvider', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.ap'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initialTransaction')
    ..hasRequiredFields = false
  ;

  AttestationProvider._() : super();
  factory AttestationProvider({
    $core.String? name,
    $core.String? address,
    $core.String? initialTransaction,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (address != null) {
      _result.address = address;
    }
    if (initialTransaction != null) {
      _result.initialTransaction = initialTransaction;
    }
    return _result;
  }
  factory AttestationProvider.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttestationProvider.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttestationProvider clone() => AttestationProvider()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttestationProvider copyWith(void Function(AttestationProvider) updates) => super.copyWith((message) => updates(message as AttestationProvider)) as AttestationProvider; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttestationProvider create() => AttestationProvider._();
  AttestationProvider createEmptyInstance() => create();
  static $pb.PbList<AttestationProvider> createRepeated() => $pb.PbList<AttestationProvider>();
  @$core.pragma('dart2js:noInline')
  static AttestationProvider getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttestationProvider>(create);
  static AttestationProvider? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get initialTransaction => $_getSZ(2);
  @$pb.TagNumber(3)
  set initialTransaction($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInitialTransaction() => $_has(2);
  @$pb.TagNumber(3)
  void clearInitialTransaction() => clearField(3);
}

