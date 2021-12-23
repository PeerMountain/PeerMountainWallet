///
//  Generated code. Do not modify.
//  source: com/kyc3/oracle/user/user-token.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../nft/token.pb.dart' as $9;

class UserTokenRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserTokenRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UserTokenRequest._() : super();
  factory UserTokenRequest() => create();
  factory UserTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserTokenRequest clone() => UserTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserTokenRequest copyWith(void Function(UserTokenRequest) updates) => super.copyWith((message) => updates(message as UserTokenRequest)) as UserTokenRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserTokenRequest create() => UserTokenRequest._();
  UserTokenRequest createEmptyInstance() => create();
  static $pb.PbList<UserTokenRequest> createRepeated() => $pb.PbList<UserTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static UserTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserTokenRequest>(create);
  static UserTokenRequest? _defaultInstance;
}

class UserTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'com.kyc3.oracle.user'), createEmptyInstance: create)
    ..pc<$9.Token>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokens', $pb.PbFieldType.PM, subBuilder: $9.Token.create)
    ..hasRequiredFields = false
  ;

  UserTokenResponse._() : super();
  factory UserTokenResponse({
    $core.Iterable<$9.Token>? tokens,
  }) {
    final _result = create();
    if (tokens != null) {
      _result.tokens.addAll(tokens);
    }
    return _result;
  }
  factory UserTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserTokenResponse clone() => UserTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserTokenResponse copyWith(void Function(UserTokenResponse) updates) => super.copyWith((message) => updates(message as UserTokenResponse)) as UserTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserTokenResponse create() => UserTokenResponse._();
  UserTokenResponse createEmptyInstance() => create();
  static $pb.PbList<UserTokenResponse> createRepeated() => $pb.PbList<UserTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static UserTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserTokenResponse>(create);
  static UserTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$9.Token> get tokens => $_getList(0);
}

