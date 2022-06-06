// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) {
  return _PatientModel.fromJson(json);
}

/// @nodoc
class _$PatientModelTearOff {
  const _$PatientModelTearOff();

  _PatientModel call(
      {required int id,
      required String firstName,
      required String lastName,
      required String defaultPicture,
      DateTime? birthDate,
      String? email,
      UserModel? user,
      String? phone,
      String? gender,
      String? country,
      String? city,
      String? profilePicture}) {
    return _PatientModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      defaultPicture: defaultPicture,
      birthDate: birthDate,
      email: email,
      user: user,
      phone: phone,
      gender: gender,
      country: country,
      city: city,
      profilePicture: profilePicture,
    );
  }

  PatientModel fromJson(Map<String, Object> json) {
    return PatientModel.fromJson(json);
  }
}

/// @nodoc
const $PatientModel = _$PatientModelTearOff();

/// @nodoc
mixin _$PatientModel {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get defaultPicture => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientModelCopyWith<PatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientModelCopyWith<$Res> {
  factory $PatientModelCopyWith(
          PatientModel value, $Res Function(PatientModel) then) =
      _$PatientModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String defaultPicture,
      DateTime? birthDate,
      String? email,
      UserModel? user,
      String? phone,
      String? gender,
      String? country,
      String? city,
      String? profilePicture});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$PatientModelCopyWithImpl<$Res> implements $PatientModelCopyWith<$Res> {
  _$PatientModelCopyWithImpl(this._value, this._then);

  final PatientModel _value;
  // ignore: unused_field
  final $Res Function(PatientModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? defaultPicture = freezed,
    Object? birthDate = freezed,
    Object? email = freezed,
    Object? user = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultPicture: defaultPicture == freezed
          ? _value.defaultPicture
          : defaultPicture // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
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
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$PatientModelCopyWith<$Res>
    implements $PatientModelCopyWith<$Res> {
  factory _$PatientModelCopyWith(
          _PatientModel value, $Res Function(_PatientModel) then) =
      __$PatientModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String defaultPicture,
      DateTime? birthDate,
      String? email,
      UserModel? user,
      String? phone,
      String? gender,
      String? country,
      String? city,
      String? profilePicture});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$PatientModelCopyWithImpl<$Res> extends _$PatientModelCopyWithImpl<$Res>
    implements _$PatientModelCopyWith<$Res> {
  __$PatientModelCopyWithImpl(
      _PatientModel _value, $Res Function(_PatientModel) _then)
      : super(_value, (v) => _then(v as _PatientModel));

  @override
  _PatientModel get _value => super._value as _PatientModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? defaultPicture = freezed,
    Object? birthDate = freezed,
    Object? email = freezed,
    Object? user = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_PatientModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      defaultPicture: defaultPicture == freezed
          ? _value.defaultPicture
          : defaultPicture // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
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
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientModel implements _PatientModel {
  _$_PatientModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.defaultPicture,
      this.birthDate,
      this.email,
      this.user,
      this.phone,
      this.gender,
      this.country,
      this.city,
      this.profilePicture});

  factory _$_PatientModel.fromJson(Map<String, dynamic> json) =>
      _$$_PatientModelFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String defaultPicture;
  @override
  final DateTime? birthDate;
  @override
  final String? email;
  @override
  final UserModel? user;
  @override
  final String? phone;
  @override
  final String? gender;
  @override
  final String? country;
  @override
  final String? city;
  @override
  final String? profilePicture;

  @override
  String toString() {
    return 'PatientModel(id: $id, firstName: $firstName, lastName: $lastName, defaultPicture: $defaultPicture, birthDate: $birthDate, email: $email, user: $user, phone: $phone, gender: $gender, country: $country, city: $city, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PatientModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.defaultPicture, defaultPicture) ||
                const DeepCollectionEquality()
                    .equals(other.defaultPicture, defaultPicture)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(defaultPicture) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(profilePicture);

  @JsonKey(ignore: true)
  @override
  _$PatientModelCopyWith<_PatientModel> get copyWith =>
      __$PatientModelCopyWithImpl<_PatientModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientModelToJson(this);
  }
}

abstract class _PatientModel implements PatientModel {
  factory _PatientModel(
      {required int id,
      required String firstName,
      required String lastName,
      required String defaultPicture,
      DateTime? birthDate,
      String? email,
      UserModel? user,
      String? phone,
      String? gender,
      String? country,
      String? city,
      String? profilePicture}) = _$_PatientModel;

  factory _PatientModel.fromJson(Map<String, dynamic> json) =
      _$_PatientModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  String get defaultPicture => throw _privateConstructorUsedError;
  @override
  DateTime? get birthDate => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get gender => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  String? get city => throw _privateConstructorUsedError;
  @override
  String? get profilePicture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatientModelCopyWith<_PatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
