// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'about_us_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AboutUsModel _$AboutUsModelFromJson(Map<String, dynamic> json) {
  return _AboutUsModel.fromJson(json);
}

/// @nodoc
class _$AboutUsModelTearOff {
  const _$AboutUsModelTearOff();

  _AboutUsModel call(
      {required String contactAddress,
      required String contactEmail,
      required String contactPhone,
      required String contactGeocoordinates}) {
    return _AboutUsModel(
      contactAddress: contactAddress,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      contactGeocoordinates: contactGeocoordinates,
    );
  }

  AboutUsModel fromJson(Map<String, Object> json) {
    return AboutUsModel.fromJson(json);
  }
}

/// @nodoc
const $AboutUsModel = _$AboutUsModelTearOff();

/// @nodoc
mixin _$AboutUsModel {
  String get contactAddress => throw _privateConstructorUsedError;
  String get contactEmail => throw _privateConstructorUsedError;
  String get contactPhone => throw _privateConstructorUsedError;
  String get contactGeocoordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AboutUsModelCopyWith<AboutUsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsModelCopyWith<$Res> {
  factory $AboutUsModelCopyWith(
          AboutUsModel value, $Res Function(AboutUsModel) then) =
      _$AboutUsModelCopyWithImpl<$Res>;
  $Res call(
      {String contactAddress,
      String contactEmail,
      String contactPhone,
      String contactGeocoordinates});
}

/// @nodoc
class _$AboutUsModelCopyWithImpl<$Res> implements $AboutUsModelCopyWith<$Res> {
  _$AboutUsModelCopyWithImpl(this._value, this._then);

  final AboutUsModel _value;
  // ignore: unused_field
  final $Res Function(AboutUsModel) _then;

  @override
  $Res call({
    Object? contactAddress = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? contactGeocoordinates = freezed,
  }) {
    return _then(_value.copyWith(
      contactAddress: contactAddress == freezed
          ? _value.contactAddress
          : contactAddress // ignore: cast_nullable_to_non_nullable
              as String,
      contactEmail: contactEmail == freezed
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: contactPhone == freezed
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      contactGeocoordinates: contactGeocoordinates == freezed
          ? _value.contactGeocoordinates
          : contactGeocoordinates // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AboutUsModelCopyWith<$Res>
    implements $AboutUsModelCopyWith<$Res> {
  factory _$AboutUsModelCopyWith(
          _AboutUsModel value, $Res Function(_AboutUsModel) then) =
      __$AboutUsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String contactAddress,
      String contactEmail,
      String contactPhone,
      String contactGeocoordinates});
}

/// @nodoc
class __$AboutUsModelCopyWithImpl<$Res> extends _$AboutUsModelCopyWithImpl<$Res>
    implements _$AboutUsModelCopyWith<$Res> {
  __$AboutUsModelCopyWithImpl(
      _AboutUsModel _value, $Res Function(_AboutUsModel) _then)
      : super(_value, (v) => _then(v as _AboutUsModel));

  @override
  _AboutUsModel get _value => super._value as _AboutUsModel;

  @override
  $Res call({
    Object? contactAddress = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? contactGeocoordinates = freezed,
  }) {
    return _then(_AboutUsModel(
      contactAddress: contactAddress == freezed
          ? _value.contactAddress
          : contactAddress // ignore: cast_nullable_to_non_nullable
              as String,
      contactEmail: contactEmail == freezed
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: contactPhone == freezed
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      contactGeocoordinates: contactGeocoordinates == freezed
          ? _value.contactGeocoordinates
          : contactGeocoordinates // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AboutUsModel implements _AboutUsModel {
  _$_AboutUsModel(
      {required this.contactAddress,
      required this.contactEmail,
      required this.contactPhone,
      required this.contactGeocoordinates});

  factory _$_AboutUsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AboutUsModelFromJson(json);

  @override
  final String contactAddress;
  @override
  final String contactEmail;
  @override
  final String contactPhone;
  @override
  final String contactGeocoordinates;

  @override
  String toString() {
    return 'AboutUsModel(contactAddress: $contactAddress, contactEmail: $contactEmail, contactPhone: $contactPhone, contactGeocoordinates: $contactGeocoordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AboutUsModel &&
            (identical(other.contactAddress, contactAddress) ||
                const DeepCollectionEquality()
                    .equals(other.contactAddress, contactAddress)) &&
            (identical(other.contactEmail, contactEmail) ||
                const DeepCollectionEquality()
                    .equals(other.contactEmail, contactEmail)) &&
            (identical(other.contactPhone, contactPhone) ||
                const DeepCollectionEquality()
                    .equals(other.contactPhone, contactPhone)) &&
            (identical(other.contactGeocoordinates, contactGeocoordinates) ||
                const DeepCollectionEquality().equals(
                    other.contactGeocoordinates, contactGeocoordinates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactAddress) ^
      const DeepCollectionEquality().hash(contactEmail) ^
      const DeepCollectionEquality().hash(contactPhone) ^
      const DeepCollectionEquality().hash(contactGeocoordinates);

  @JsonKey(ignore: true)
  @override
  _$AboutUsModelCopyWith<_AboutUsModel> get copyWith =>
      __$AboutUsModelCopyWithImpl<_AboutUsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AboutUsModelToJson(this);
  }
}

abstract class _AboutUsModel implements AboutUsModel {
  factory _AboutUsModel(
      {required String contactAddress,
      required String contactEmail,
      required String contactPhone,
      required String contactGeocoordinates}) = _$_AboutUsModel;

  factory _AboutUsModel.fromJson(Map<String, dynamic> json) =
      _$_AboutUsModel.fromJson;

  @override
  String get contactAddress => throw _privateConstructorUsedError;
  @override
  String get contactEmail => throw _privateConstructorUsedError;
  @override
  String get contactPhone => throw _privateConstructorUsedError;
  @override
  String get contactGeocoordinates => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AboutUsModelCopyWith<_AboutUsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
