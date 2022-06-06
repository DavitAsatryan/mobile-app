// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transportation_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransportationDetails _$TransportationDetailsFromJson(
    Map<String, dynamic> json) {
  return _TransportationDetails.fromJson(json);
}

/// @nodoc
class _$TransportationDetailsTearOff {
  const _$TransportationDetailsTearOff();

  _TransportationDetails call(
      {required Branch branch,
      required String duration,
      required int price,
      required double km}) {
    return _TransportationDetails(
      branch: branch,
      duration: duration,
      price: price,
      km: km,
    );
  }

  TransportationDetails fromJson(Map<String, Object> json) {
    return TransportationDetails.fromJson(json);
  }
}

/// @nodoc
const $TransportationDetails = _$TransportationDetailsTearOff();

/// @nodoc
mixin _$TransportationDetails {
  Branch get branch => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  double get km => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportationDetailsCopyWith<TransportationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportationDetailsCopyWith<$Res> {
  factory $TransportationDetailsCopyWith(TransportationDetails value,
          $Res Function(TransportationDetails) then) =
      _$TransportationDetailsCopyWithImpl<$Res>;
  $Res call({Branch branch, String duration, int price, double km});

  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class _$TransportationDetailsCopyWithImpl<$Res>
    implements $TransportationDetailsCopyWith<$Res> {
  _$TransportationDetailsCopyWithImpl(this._value, this._then);

  final TransportationDetails _value;
  // ignore: unused_field
  final $Res Function(TransportationDetails) _then;

  @override
  $Res call({
    Object? branch = freezed,
    Object? duration = freezed,
    Object? price = freezed,
    Object? km = freezed,
  }) {
    return _then(_value.copyWith(
      branch: branch == freezed
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      km: km == freezed
          ? _value.km
          : km // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value));
    });
  }
}

/// @nodoc
abstract class _$TransportationDetailsCopyWith<$Res>
    implements $TransportationDetailsCopyWith<$Res> {
  factory _$TransportationDetailsCopyWith(_TransportationDetails value,
          $Res Function(_TransportationDetails) then) =
      __$TransportationDetailsCopyWithImpl<$Res>;
  @override
  $Res call({Branch branch, String duration, int price, double km});

  @override
  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$TransportationDetailsCopyWithImpl<$Res>
    extends _$TransportationDetailsCopyWithImpl<$Res>
    implements _$TransportationDetailsCopyWith<$Res> {
  __$TransportationDetailsCopyWithImpl(_TransportationDetails _value,
      $Res Function(_TransportationDetails) _then)
      : super(_value, (v) => _then(v as _TransportationDetails));

  @override
  _TransportationDetails get _value => super._value as _TransportationDetails;

  @override
  $Res call({
    Object? branch = freezed,
    Object? duration = freezed,
    Object? price = freezed,
    Object? km = freezed,
  }) {
    return _then(_TransportationDetails(
      branch: branch == freezed
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      km: km == freezed
          ? _value.km
          : km // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransportationDetails implements _TransportationDetails {
  _$_TransportationDetails(
      {required this.branch,
      required this.duration,
      required this.price,
      required this.km});

  factory _$_TransportationDetails.fromJson(Map<String, dynamic> json) =>
      _$$_TransportationDetailsFromJson(json);

  @override
  final Branch branch;
  @override
  final String duration;
  @override
  final int price;
  @override
  final double km;

  @override
  String toString() {
    return 'TransportationDetails(branch: $branch, duration: $duration, price: $price, km: $km)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransportationDetails &&
            (identical(other.branch, branch) ||
                const DeepCollectionEquality().equals(other.branch, branch)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.km, km) ||
                const DeepCollectionEquality().equals(other.km, km)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(branch) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(km);

  @JsonKey(ignore: true)
  @override
  _$TransportationDetailsCopyWith<_TransportationDetails> get copyWith =>
      __$TransportationDetailsCopyWithImpl<_TransportationDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransportationDetailsToJson(this);
  }
}

abstract class _TransportationDetails implements TransportationDetails {
  factory _TransportationDetails(
      {required Branch branch,
      required String duration,
      required int price,
      required double km}) = _$_TransportationDetails;

  factory _TransportationDetails.fromJson(Map<String, dynamic> json) =
      _$_TransportationDetails.fromJson;

  @override
  Branch get branch => throw _privateConstructorUsedError;
  @override
  String get duration => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  double get km => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransportationDetailsCopyWith<_TransportationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
