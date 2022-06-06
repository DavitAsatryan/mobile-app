// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_bundle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BundlesServiceModel _$BundlesServiceModelFromJson(Map<String, dynamic> json) {
  return _BundlesServiceModel.fromJson(json);
}

/// @nodoc
class _$BundlesServiceModelTearOff {
  const _$BundlesServiceModelTearOff();

  _BundlesServiceModel call(
      {required int id,
      required String createdAt,
      required int bundleId,
      required int serviceId}) {
    return _BundlesServiceModel(
      id: id,
      createdAt: createdAt,
      bundleId: bundleId,
      serviceId: serviceId,
    );
  }

  BundlesServiceModel fromJson(Map<String, Object> json) {
    return BundlesServiceModel.fromJson(json);
  }
}

/// @nodoc
const $BundlesServiceModel = _$BundlesServiceModelTearOff();

/// @nodoc
mixin _$BundlesServiceModel {
  int get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get bundleId => throw _privateConstructorUsedError;
  int get serviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundlesServiceModelCopyWith<BundlesServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundlesServiceModelCopyWith<$Res> {
  factory $BundlesServiceModelCopyWith(
          BundlesServiceModel value, $Res Function(BundlesServiceModel) then) =
      _$BundlesServiceModelCopyWithImpl<$Res>;
  $Res call({int id, String createdAt, int bundleId, int serviceId});
}

/// @nodoc
class _$BundlesServiceModelCopyWithImpl<$Res>
    implements $BundlesServiceModelCopyWith<$Res> {
  _$BundlesServiceModelCopyWithImpl(this._value, this._then);

  final BundlesServiceModel _value;
  // ignore: unused_field
  final $Res Function(BundlesServiceModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? bundleId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      bundleId: bundleId == freezed
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BundlesServiceModelCopyWith<$Res>
    implements $BundlesServiceModelCopyWith<$Res> {
  factory _$BundlesServiceModelCopyWith(_BundlesServiceModel value,
          $Res Function(_BundlesServiceModel) then) =
      __$BundlesServiceModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String createdAt, int bundleId, int serviceId});
}

/// @nodoc
class __$BundlesServiceModelCopyWithImpl<$Res>
    extends _$BundlesServiceModelCopyWithImpl<$Res>
    implements _$BundlesServiceModelCopyWith<$Res> {
  __$BundlesServiceModelCopyWithImpl(
      _BundlesServiceModel _value, $Res Function(_BundlesServiceModel) _then)
      : super(_value, (v) => _then(v as _BundlesServiceModel));

  @override
  _BundlesServiceModel get _value => super._value as _BundlesServiceModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? bundleId = freezed,
    Object? serviceId = freezed,
  }) {
    return _then(_BundlesServiceModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      bundleId: bundleId == freezed
          ? _value.bundleId
          : bundleId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BundlesServiceModel implements _BundlesServiceModel {
  _$_BundlesServiceModel(
      {required this.id,
      required this.createdAt,
      required this.bundleId,
      required this.serviceId});

  factory _$_BundlesServiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_BundlesServiceModelFromJson(json);

  @override
  final int id;
  @override
  final String createdAt;
  @override
  final int bundleId;
  @override
  final int serviceId;

  @override
  String toString() {
    return 'BundlesServiceModel(id: $id, createdAt: $createdAt, bundleId: $bundleId, serviceId: $serviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BundlesServiceModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.bundleId, bundleId) ||
                const DeepCollectionEquality()
                    .equals(other.bundleId, bundleId)) &&
            (identical(other.serviceId, serviceId) ||
                const DeepCollectionEquality()
                    .equals(other.serviceId, serviceId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(bundleId) ^
      const DeepCollectionEquality().hash(serviceId);

  @JsonKey(ignore: true)
  @override
  _$BundlesServiceModelCopyWith<_BundlesServiceModel> get copyWith =>
      __$BundlesServiceModelCopyWithImpl<_BundlesServiceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BundlesServiceModelToJson(this);
  }
}

abstract class _BundlesServiceModel implements BundlesServiceModel {
  factory _BundlesServiceModel(
      {required int id,
      required String createdAt,
      required int bundleId,
      required int serviceId}) = _$_BundlesServiceModel;

  factory _BundlesServiceModel.fromJson(Map<String, dynamic> json) =
      _$_BundlesServiceModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  int get bundleId => throw _privateConstructorUsedError;
  @override
  int get serviceId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BundlesServiceModelCopyWith<_BundlesServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
