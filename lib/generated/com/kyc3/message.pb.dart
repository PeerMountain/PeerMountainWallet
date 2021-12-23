///
//  Generated code. Do not modify.
//  source: com/kyc3/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/any.pb.dart' as $1;
import 'exchange.pb.dart' as $2;

class SignedAnonymousMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignedAnonymousMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey')
    ..aOM<$1.Any>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  SignedAnonymousMessage._() : super();
  factory SignedAnonymousMessage({
    $core.String? signature,
    $core.String? address,
    $core.String? publicKey,
    $1.Any? message,
  }) {
    final _result = create();
    if (signature != null) {
      _result.signature = signature;
    }
    if (address != null) {
      _result.address = address;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory SignedAnonymousMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedAnonymousMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedAnonymousMessage clone() => SignedAnonymousMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedAnonymousMessage copyWith(void Function(SignedAnonymousMessage) updates) => super.copyWith((message) => updates(message as SignedAnonymousMessage)) as SignedAnonymousMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignedAnonymousMessage create() => SignedAnonymousMessage._();
  SignedAnonymousMessage createEmptyInstance() => create();
  static $pb.PbList<SignedAnonymousMessage> createRepeated() => $pb.PbList<SignedAnonymousMessage>();
  @$core.pragma('dart2js:noInline')
  static SignedAnonymousMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedAnonymousMessage>(create);
  static SignedAnonymousMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signature => $_getSZ(0);
  @$pb.TagNumber(1)
  set signature($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get publicKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set publicKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => clearField(3);

  @$pb.TagNumber(4)
  $1.Any get message => $_getN(3);
  @$pb.TagNumber(4)
  set message($1.Any v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);
  @$pb.TagNumber(4)
  $1.Any ensureMessage() => $_ensure(3);
}

class SignedAddressedMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignedAddressedMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey')
    ..aOM<$1.Any>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  SignedAddressedMessage._() : super();
  factory SignedAddressedMessage({
    $core.String? signature,
    $core.String? publicKey,
    $1.Any? message,
  }) {
    final _result = create();
    if (signature != null) {
      _result.signature = signature;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory SignedAddressedMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedAddressedMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedAddressedMessage clone() => SignedAddressedMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedAddressedMessage copyWith(void Function(SignedAddressedMessage) updates) => super.copyWith((message) => updates(message as SignedAddressedMessage)) as SignedAddressedMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignedAddressedMessage create() => SignedAddressedMessage._();
  SignedAddressedMessage createEmptyInstance() => create();
  static $pb.PbList<SignedAddressedMessage> createRepeated() => $pb.PbList<SignedAddressedMessage>();
  @$core.pragma('dart2js:noInline')
  static SignedAddressedMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedAddressedMessage>(create);
  static SignedAddressedMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signature => $_getSZ(0);
  @$pb.TagNumber(1)
  set signature($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get publicKey => $_getSZ(1);
  @$pb.TagNumber(3)
  set publicKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(3)
  void clearPublicKey() => clearField(3);

  @$pb.TagNumber(4)
  $1.Any get message => $_getN(2);
  @$pb.TagNumber(4)
  set message($1.Any v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);
  @$pb.TagNumber(4)
  $1.Any ensureMessage() => $_ensure(2);
}

enum SignedMessage_Body {
  anonymous, 
  addressed, 
  notSet
}

class SignedMessage extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SignedMessage_Body> _SignedMessage_BodyByTag = {
    1 : SignedMessage_Body.anonymous,
    2 : SignedMessage_Body.addressed,
    0 : SignedMessage_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignedMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<SignedAnonymousMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'anonymous', subBuilder: SignedAnonymousMessage.create)
    ..aOM<SignedAddressedMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addressed', subBuilder: SignedAddressedMessage.create)
    ..hasRequiredFields = false
  ;

  SignedMessage._() : super();
  factory SignedMessage({
    SignedAnonymousMessage? anonymous,
    SignedAddressedMessage? addressed,
  }) {
    final _result = create();
    if (anonymous != null) {
      _result.anonymous = anonymous;
    }
    if (addressed != null) {
      _result.addressed = addressed;
    }
    return _result;
  }
  factory SignedMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedMessage clone() => SignedMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedMessage copyWith(void Function(SignedMessage) updates) => super.copyWith((message) => updates(message as SignedMessage)) as SignedMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignedMessage create() => SignedMessage._();
  SignedMessage createEmptyInstance() => create();
  static $pb.PbList<SignedMessage> createRepeated() => $pb.PbList<SignedMessage>();
  @$core.pragma('dart2js:noInline')
  static SignedMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedMessage>(create);
  static SignedMessage? _defaultInstance;

  SignedMessage_Body whichBody() => _SignedMessage_BodyByTag[$_whichOneof(0)]!;
  void clearBody() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  SignedAnonymousMessage get anonymous => $_getN(0);
  @$pb.TagNumber(1)
  set anonymous(SignedAnonymousMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAnonymous() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnonymous() => clearField(1);
  @$pb.TagNumber(1)
  SignedAnonymousMessage ensureAnonymous() => $_ensure(0);

  @$pb.TagNumber(2)
  SignedAddressedMessage get addressed => $_getN(1);
  @$pb.TagNumber(2)
  set addressed(SignedAddressedMessage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddressed() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddressed() => clearField(2);
  @$pb.TagNumber(2)
  SignedAddressedMessage ensureAddressed() => $_ensure(1);
}

class EncryptedMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EncryptedMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nonce')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ephemPublicKey')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cipherText')
    ..hasRequiredFields = false
  ;

  EncryptedMessage._() : super();
  factory EncryptedMessage({
    $core.String? version,
    $core.String? nonce,
    $core.String? ephemPublicKey,
    $core.String? cipherText,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (ephemPublicKey != null) {
      _result.ephemPublicKey = ephemPublicKey;
    }
    if (cipherText != null) {
      _result.cipherText = cipherText;
    }
    return _result;
  }
  factory EncryptedMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EncryptedMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EncryptedMessage clone() => EncryptedMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EncryptedMessage copyWith(void Function(EncryptedMessage) updates) => super.copyWith((message) => updates(message as EncryptedMessage)) as EncryptedMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EncryptedMessage create() => EncryptedMessage._();
  EncryptedMessage createEmptyInstance() => create();
  static $pb.PbList<EncryptedMessage> createRepeated() => $pb.PbList<EncryptedMessage>();
  @$core.pragma('dart2js:noInline')
  static EncryptedMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EncryptedMessage>(create);
  static EncryptedMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nonce => $_getSZ(1);
  @$pb.TagNumber(2)
  set nonce($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ephemPublicKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set ephemPublicKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEphemPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearEphemPublicKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cipherText => $_getSZ(3);
  @$pb.TagNumber(4)
  set cipherText($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCipherText() => $_has(3);
  @$pb.TagNumber(4)
  void clearCipherText() => clearField(4);
}

enum GeneralMessage_Body {
  exchange, 
  message, 
  notSet
}

class GeneralMessage extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GeneralMessage_Body> _GeneralMessage_BodyByTag = {
    1 : GeneralMessage_Body.exchange,
    2 : GeneralMessage_Body.message,
    0 : GeneralMessage_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GeneralMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$2.ExchangeKeysRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exchange', subBuilder: $2.ExchangeKeysRequest.create)
    ..aOM<EncryptedMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: EncryptedMessage.create)
    ..hasRequiredFields = false
  ;

  GeneralMessage._() : super();
  factory GeneralMessage({
    $2.ExchangeKeysRequest? exchange,
    EncryptedMessage? message,
  }) {
    final _result = create();
    if (exchange != null) {
      _result.exchange = exchange;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory GeneralMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeneralMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GeneralMessage clone() => GeneralMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GeneralMessage copyWith(void Function(GeneralMessage) updates) => super.copyWith((message) => updates(message as GeneralMessage)) as GeneralMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeneralMessage create() => GeneralMessage._();
  GeneralMessage createEmptyInstance() => create();
  static $pb.PbList<GeneralMessage> createRepeated() => $pb.PbList<GeneralMessage>();
  @$core.pragma('dart2js:noInline')
  static GeneralMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeneralMessage>(create);
  static GeneralMessage? _defaultInstance;

  GeneralMessage_Body whichBody() => _GeneralMessage_BodyByTag[$_whichOneof(0)]!;
  void clearBody() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $2.ExchangeKeysRequest get exchange => $_getN(0);
  @$pb.TagNumber(1)
  set exchange($2.ExchangeKeysRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasExchange() => $_has(0);
  @$pb.TagNumber(1)
  void clearExchange() => clearField(1);
  @$pb.TagNumber(1)
  $2.ExchangeKeysRequest ensureExchange() => $_ensure(0);

  @$pb.TagNumber(2)
  EncryptedMessage get message => $_getN(1);
  @$pb.TagNumber(2)
  set message(EncryptedMessage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
  @$pb.TagNumber(2)
  EncryptedMessage ensureMessage() => $_ensure(1);
}

