// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) {
  return _LoginResult.fromJson(json);
}

/// @nodoc
class _$LoginResultTearOff {
  const _$LoginResultTearOff();

  _LoginResult call({required String jwtToken, required String refreshKey}) {
    return _LoginResult(
      jwtToken: jwtToken,
      refreshKey: refreshKey,
    );
  }

  LoginResult fromJson(Map<String, Object> json) {
    return LoginResult.fromJson(json);
  }
}

/// @nodoc
const $LoginResult = _$LoginResultTearOff();

/// @nodoc
mixin _$LoginResult {
  String get jwtToken => throw _privateConstructorUsedError;
  String get refreshKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResultCopyWith<LoginResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResultCopyWith<$Res> {
  factory $LoginResultCopyWith(
          LoginResult value, $Res Function(LoginResult) then) =
      _$LoginResultCopyWithImpl<$Res>;
  $Res call({String jwtToken, String refreshKey});
}

/// @nodoc
class _$LoginResultCopyWithImpl<$Res> implements $LoginResultCopyWith<$Res> {
  _$LoginResultCopyWithImpl(this._value, this._then);

  final LoginResult _value;
  // ignore: unused_field
  final $Res Function(LoginResult) _then;

  @override
  $Res call({
    Object? jwtToken = freezed,
    Object? refreshKey = freezed,
  }) {
    return _then(_value.copyWith(
      jwtToken: jwtToken == freezed
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshKey: refreshKey == freezed
          ? _value.refreshKey
          : refreshKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginResultCopyWith<$Res>
    implements $LoginResultCopyWith<$Res> {
  factory _$LoginResultCopyWith(
          _LoginResult value, $Res Function(_LoginResult) then) =
      __$LoginResultCopyWithImpl<$Res>;
  @override
  $Res call({String jwtToken, String refreshKey});
}

/// @nodoc
class __$LoginResultCopyWithImpl<$Res> extends _$LoginResultCopyWithImpl<$Res>
    implements _$LoginResultCopyWith<$Res> {
  __$LoginResultCopyWithImpl(
      _LoginResult _value, $Res Function(_LoginResult) _then)
      : super(_value, (v) => _then(v as _LoginResult));

  @override
  _LoginResult get _value => super._value as _LoginResult;

  @override
  $Res call({
    Object? jwtToken = freezed,
    Object? refreshKey = freezed,
  }) {
    return _then(_LoginResult(
      jwtToken: jwtToken == freezed
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshKey: refreshKey == freezed
          ? _value.refreshKey
          : refreshKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginResult implements _LoginResult {
  _$_LoginResult({required this.jwtToken, required this.refreshKey});

  factory _$_LoginResult.fromJson(Map<String, dynamic> json) =>
      _$$_LoginResultFromJson(json);

  @override
  final String jwtToken;
  @override
  final String refreshKey;

  @override
  String toString() {
    return 'LoginResult(jwtToken: $jwtToken, refreshKey: $refreshKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginResult &&
            (identical(other.jwtToken, jwtToken) ||
                const DeepCollectionEquality()
                    .equals(other.jwtToken, jwtToken)) &&
            (identical(other.refreshKey, refreshKey) ||
                const DeepCollectionEquality()
                    .equals(other.refreshKey, refreshKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(jwtToken) ^
      const DeepCollectionEquality().hash(refreshKey);

  @JsonKey(ignore: true)
  @override
  _$LoginResultCopyWith<_LoginResult> get copyWith =>
      __$LoginResultCopyWithImpl<_LoginResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginResultToJson(this);
  }
}

abstract class _LoginResult implements LoginResult {
  factory _LoginResult({required String jwtToken, required String refreshKey}) =
      _$_LoginResult;

  factory _LoginResult.fromJson(Map<String, dynamic> json) =
      _$_LoginResult.fromJson;

  @override
  String get jwtToken => throw _privateConstructorUsedError;
  @override
  String get refreshKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginResultCopyWith<_LoginResult> get copyWith =>
      throw _privateConstructorUsedError;
}
