// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestPatientModel _$RequestPatientModelFromJson(Map<String, dynamic> json) {
  return _RequestPatientModel.fromJson(json);
}

/// @nodoc
class _$RequestPatientModelTearOff {
  const _$RequestPatientModelTearOff();

  _RequestPatientModel call(
      {required String firstName,
      required String lastName,
      @JsonKey(includeIfNull: false) DateTime? birthDate,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? gender,
      @JsonKey(includeIfNull: false) String? country,
      @JsonKey(includeIfNull: false) String? city}) {
    return _RequestPatientModel(
      firstName: firstName,
      lastName: lastName,
      birthDate: birthDate,
      email: email,
      phone: phone,
      gender: gender,
      country: country,
      city: city,
    );
  }

  RequestPatientModel fromJson(Map<String, Object> json) {
    return RequestPatientModel.fromJson(json);
  }
}

/// @nodoc
const $RequestPatientModel = _$RequestPatientModelTearOff();

/// @nodoc
mixin _$RequestPatientModel {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  DateTime? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestPatientModelCopyWith<RequestPatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestPatientModelCopyWith<$Res> {
  factory $RequestPatientModelCopyWith(
          RequestPatientModel value, $Res Function(RequestPatientModel) then) =
      _$RequestPatientModelCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      @JsonKey(includeIfNull: false) DateTime? birthDate,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? gender,
      @JsonKey(includeIfNull: false) String? country,
      @JsonKey(includeIfNull: false) String? city});
}

/// @nodoc
class _$RequestPatientModelCopyWithImpl<$Res>
    implements $RequestPatientModelCopyWith<$Res> {
  _$RequestPatientModelCopyWithImpl(this._value, this._then);

  final RequestPatientModel _value;
  // ignore: unused_field
  final $Res Function(RequestPatientModel) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? country = freezed,
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RequestPatientModelCopyWith<$Res>
    implements $RequestPatientModelCopyWith<$Res> {
  factory _$RequestPatientModelCopyWith(_RequestPatientModel value,
          $Res Function(_RequestPatientModel) then) =
      __$RequestPatientModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      @JsonKey(includeIfNull: false) DateTime? birthDate,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? gender,
      @JsonKey(includeIfNull: false) String? country,
      @JsonKey(includeIfNull: false) String? city});
}

/// @nodoc
class __$RequestPatientModelCopyWithImpl<$Res>
    extends _$RequestPatientModelCopyWithImpl<$Res>
    implements _$RequestPatientModelCopyWith<$Res> {
  __$RequestPatientModelCopyWithImpl(
      _RequestPatientModel _value, $Res Function(_RequestPatientModel) _then)
      : super(_value, (v) => _then(v as _RequestPatientModel));

  @override
  _RequestPatientModel get _value => super._value as _RequestPatientModel;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? country = freezed,
    Object? city = freezed,
  }) {
    return _then(_RequestPatientModel(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestPatientModel implements _RequestPatientModel {
  _$_RequestPatientModel(
      {required this.firstName,
      required this.lastName,
      @JsonKey(includeIfNull: false) this.birthDate,
      @JsonKey(includeIfNull: false) this.email,
      @JsonKey(includeIfNull: false) this.phone,
      @JsonKey(includeIfNull: false) this.gender,
      @JsonKey(includeIfNull: false) this.country,
      @JsonKey(includeIfNull: false) this.city});

  factory _$_RequestPatientModel.fromJson(Map<String, dynamic> json) =>
      _$$_RequestPatientModelFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? birthDate;
  @override
  @JsonKey(includeIfNull: false)
  final String? email;
  @override
  @JsonKey(includeIfNull: false)
  final String? phone;
  @override
  @JsonKey(includeIfNull: false)
  final String? gender;
  @override
  @JsonKey(includeIfNull: false)
  final String? country;
  @override
  @JsonKey(includeIfNull: false)
  final String? city;

  @override
  String toString() {
    return 'RequestPatientModel(firstName: $firstName, lastName: $lastName, birthDate: $birthDate, email: $email, phone: $phone, gender: $gender, country: $country, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestPatientModel &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(city);

  @JsonKey(ignore: true)
  @override
  _$RequestPatientModelCopyWith<_RequestPatientModel> get copyWith =>
      __$RequestPatientModelCopyWithImpl<_RequestPatientModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestPatientModelToJson(this);
  }
}

abstract class _RequestPatientModel implements RequestPatientModel {
  factory _RequestPatientModel(
      {required String firstName,
      required String lastName,
      @JsonKey(includeIfNull: false) DateTime? birthDate,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false) String? gender,
      @JsonKey(includeIfNull: false) String? country,
      @JsonKey(includeIfNull: false) String? city}) = _$_RequestPatientModel;

  factory _RequestPatientModel.fromJson(Map<String, dynamic> json) =
      _$_RequestPatientModel.fromJson;

  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  DateTime? get birthDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  String? get phone => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  String? get gender => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  String? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  String? get city => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RequestPatientModelCopyWith<_RequestPatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
