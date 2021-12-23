///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/payment/invoice.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Invoice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Invoice', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.payment'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attestationProvider')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.O3)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paymentNonce')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cashierAddress')
    ..hasRequiredFields = false
  ;

  Invoice._() : super();
  factory Invoice({
    $core.String? attestationProvider,
    $core.int? price,
    $fixnum.Int64? paymentNonce,
    $core.String? cashierAddress,
  }) {
    final _result = create();
    if (attestationProvider != null) {
      _result.attestationProvider = attestationProvider;
    }
    if (price != null) {
      _result.price = price;
    }
    if (paymentNonce != null) {
      _result.paymentNonce = paymentNonce;
    }
    if (cashierAddress != null) {
      _result.cashierAddress = cashierAddress;
    }
    return _result;
  }
  factory Invoice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Invoice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Invoice clone() => Invoice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Invoice copyWith(void Function(Invoice) updates) => super.copyWith((message) => updates(message as Invoice)) as Invoice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Invoice create() => Invoice._();
  Invoice createEmptyInstance() => create();
  static $pb.PbList<Invoice> createRepeated() => $pb.PbList<Invoice>();
  @$core.pragma('dart2js:noInline')
  static Invoice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Invoice>(create);
  static Invoice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get attestationProvider => $_getSZ(0);
  @$pb.TagNumber(1)
  set attestationProvider($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAttestationProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttestationProvider() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get paymentNonce => $_getI64(2);
  @$pb.TagNumber(3)
  set paymentNonce($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPaymentNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaymentNonce() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cashierAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set cashierAddress($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCashierAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearCashierAddress() => clearField(4);
}

