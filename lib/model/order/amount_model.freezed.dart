// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'amount_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AmountModel _$AmountModelFromJson(Map<String, dynamic> json) {
  return _AmountModel.fromJson(json);
}

/// @nodoc
class _$AmountModelTearOff {
  const _$AmountModelTearOff();

  _AmountModel call({required String currency, required int total}) {
    return _AmountModel(
      currency: currency,
      total: total,
    );
  }

  AmountModel fromJson(Map<String, Object> json) {
    return AmountModel.fromJson(json);
  }
}

/// @nodoc
const $AmountModel = _$AmountModelTearOff();

/// @nodoc
mixin _$AmountModel {
  String get currency => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmountModelCopyWith<AmountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountModelCopyWith<$Res> {
  factory $AmountModelCopyWith(
          AmountModel value, $Res Function(AmountModel) then) =
      _$AmountModelCopyWithImpl<$Res>;
  $Res call({String currency, int total});
}

/// @nodoc
class _$AmountModelCopyWithImpl<$Res> implements $AmountModelCopyWith<$Res> {
  _$AmountModelCopyWithImpl(this._value, this._then);

  final AmountModel _value;
  // ignore: unused_field
  final $Res Function(AmountModel) _then;

  @override
  $Res call({
    Object? currency = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AmountModelCopyWith<$Res>
    implements $AmountModelCopyWith<$Res> {
  factory _$AmountModelCopyWith(
          _AmountModel value, $Res Function(_AmountModel) then) =
      __$AmountModelCopyWithImpl<$Res>;
  @override
  $Res call({String currency, int total});
}

/// @nodoc
class __$AmountModelCopyWithImpl<$Res> extends _$AmountModelCopyWithImpl<$Res>
    implements _$AmountModelCopyWith<$Res> {
  __$AmountModelCopyWithImpl(
      _AmountModel _value, $Res Function(_AmountModel) _then)
      : super(_value, (v) => _then(v as _AmountModel));

  @override
  _AmountModel get _value => super._value as _AmountModel;

  @override
  $Res call({
    Object? currency = freezed,
    Object? total = freezed,
  }) {
    return _then(_AmountModel(
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AmountModel implements _AmountModel {
  _$_AmountModel({required this.currency, required this.total});

  factory _$_AmountModel.fromJson(Map<String, dynamic> json) =>
      _$$_AmountModelFromJson(json);

  @override
  final String currency;
  @override
  final int total;

  @override
  String toString() {
    return 'AmountModel(currency: $currency, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AmountModel &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$AmountModelCopyWith<_AmountModel> get copyWith =>
      __$AmountModelCopyWithImpl<_AmountModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AmountModelToJson(this);
  }
}

abstract class _AmountModel implements AmountModel {
  factory _AmountModel({required String currency, required int total}) =
      _$_AmountModel;

  factory _AmountModel.fromJson(Map<String, dynamic> json) =
      _$_AmountModel.fromJson;

  @override
  String get currency => throw _privateConstructorUsedError;
  @override
  int get total => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AmountModelCopyWith<_AmountModel> get copyWith =>
      throw _privateConstructorUsedError;
}
