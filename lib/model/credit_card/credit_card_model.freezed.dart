// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credit_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreditCardModel _$CreditCardModelFromJson(Map<String, dynamic> json) {
  return _CreditCardModel.fromJson(json);
}

/// @nodoc
class _$CreditCardModelTearOff {
  const _$CreditCardModelTearOff();

  _CreditCardModel call(
      {required int id,
      required String cardholderName,
      required String maskedNumber,
      String? cardDate,
      required bool isDefault}) {
    return _CreditCardModel(
      id: id,
      cardholderName: cardholderName,
      maskedNumber: maskedNumber,
      cardDate: cardDate,
      isDefault: isDefault,
    );
  }

  CreditCardModel fromJson(Map<String, Object> json) {
    return CreditCardModel.fromJson(json);
  }
}

/// @nodoc
const $CreditCardModel = _$CreditCardModelTearOff();

/// @nodoc
mixin _$CreditCardModel {
  int get id => throw _privateConstructorUsedError;
  String get cardholderName => throw _privateConstructorUsedError;
  String get maskedNumber => throw _privateConstructorUsedError;
  String? get cardDate => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditCardModelCopyWith<CreditCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardModelCopyWith<$Res> {
  factory $CreditCardModelCopyWith(
          CreditCardModel value, $Res Function(CreditCardModel) then) =
      _$CreditCardModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String cardholderName,
      String maskedNumber,
      String? cardDate,
      bool isDefault});
}

/// @nodoc
class _$CreditCardModelCopyWithImpl<$Res>
    implements $CreditCardModelCopyWith<$Res> {
  _$CreditCardModelCopyWithImpl(this._value, this._then);

  final CreditCardModel _value;
  // ignore: unused_field
  final $Res Function(CreditCardModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cardholderName = freezed,
    Object? maskedNumber = freezed,
    Object? cardDate = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardholderName: cardholderName == freezed
          ? _value.cardholderName
          : cardholderName // ignore: cast_nullable_to_non_nullable
              as String,
      maskedNumber: maskedNumber == freezed
          ? _value.maskedNumber
          : maskedNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardDate: cardDate == freezed
          ? _value.cardDate
          : cardDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CreditCardModelCopyWith<$Res>
    implements $CreditCardModelCopyWith<$Res> {
  factory _$CreditCardModelCopyWith(
          _CreditCardModel value, $Res Function(_CreditCardModel) then) =
      __$CreditCardModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String cardholderName,
      String maskedNumber,
      String? cardDate,
      bool isDefault});
}

/// @nodoc
class __$CreditCardModelCopyWithImpl<$Res>
    extends _$CreditCardModelCopyWithImpl<$Res>
    implements _$CreditCardModelCopyWith<$Res> {
  __$CreditCardModelCopyWithImpl(
      _CreditCardModel _value, $Res Function(_CreditCardModel) _then)
      : super(_value, (v) => _then(v as _CreditCardModel));

  @override
  _CreditCardModel get _value => super._value as _CreditCardModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? cardholderName = freezed,
    Object? maskedNumber = freezed,
    Object? cardDate = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_CreditCardModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardholderName: cardholderName == freezed
          ? _value.cardholderName
          : cardholderName // ignore: cast_nullable_to_non_nullable
              as String,
      maskedNumber: maskedNumber == freezed
          ? _value.maskedNumber
          : maskedNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardDate: cardDate == freezed
          ? _value.cardDate
          : cardDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreditCardModel implements _CreditCardModel {
  _$_CreditCardModel(
      {required this.id,
      required this.cardholderName,
      required this.maskedNumber,
      this.cardDate,
      required this.isDefault});

  factory _$_CreditCardModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreditCardModelFromJson(json);

  @override
  final int id;
  @override
  final String cardholderName;
  @override
  final String maskedNumber;
  @override
  final String? cardDate;
  @override
  final bool isDefault;

  @override
  String toString() {
    return 'CreditCardModel(id: $id, cardholderName: $cardholderName, maskedNumber: $maskedNumber, cardDate: $cardDate, isDefault: $isDefault)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreditCardModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.cardholderName, cardholderName) ||
                const DeepCollectionEquality()
                    .equals(other.cardholderName, cardholderName)) &&
            (identical(other.maskedNumber, maskedNumber) ||
                const DeepCollectionEquality()
                    .equals(other.maskedNumber, maskedNumber)) &&
            (identical(other.cardDate, cardDate) ||
                const DeepCollectionEquality()
                    .equals(other.cardDate, cardDate)) &&
            (identical(other.isDefault, isDefault) ||
                const DeepCollectionEquality()
                    .equals(other.isDefault, isDefault)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(cardholderName) ^
      const DeepCollectionEquality().hash(maskedNumber) ^
      const DeepCollectionEquality().hash(cardDate) ^
      const DeepCollectionEquality().hash(isDefault);

  @JsonKey(ignore: true)
  @override
  _$CreditCardModelCopyWith<_CreditCardModel> get copyWith =>
      __$CreditCardModelCopyWithImpl<_CreditCardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreditCardModelToJson(this);
  }
}

abstract class _CreditCardModel implements CreditCardModel {
  factory _CreditCardModel(
      {required int id,
      required String cardholderName,
      required String maskedNumber,
      String? cardDate,
      required bool isDefault}) = _$_CreditCardModel;

  factory _CreditCardModel.fromJson(Map<String, dynamic> json) =
      _$_CreditCardModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get cardholderName => throw _privateConstructorUsedError;
  @override
  String get maskedNumber => throw _privateConstructorUsedError;
  @override
  String? get cardDate => throw _privateConstructorUsedError;
  @override
  bool get isDefault => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CreditCardModelCopyWith<_CreditCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
