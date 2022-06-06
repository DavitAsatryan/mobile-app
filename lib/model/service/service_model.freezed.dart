// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return _ServiceModel.fromJson(json);
}

/// @nodoc
class _$ServiceModelTearOff {
  const _$ServiceModelTearOff();

  _ServiceModel call(
      {required int id,
      required String name,
      String? description,
      String? createdByName,
      List<BundlesServiceModel>? bundlesServicesModel,
      String? icon,
      int? categoryId,
      int? price}) {
    return _ServiceModel(
      id: id,
      name: name,
      description: description,
      createdByName: createdByName,
      bundlesServicesModel: bundlesServicesModel,
      icon: icon,
      categoryId: categoryId,
      price: price,
    );
  }

  ServiceModel fromJson(Map<String, Object> json) {
    return ServiceModel.fromJson(json);
  }
}

/// @nodoc
const $ServiceModel = _$ServiceModelTearOff();

/// @nodoc
mixin _$ServiceModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get createdByName => throw _privateConstructorUsedError;
  List<BundlesServiceModel>? get bundlesServicesModel =>
      throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceModelCopyWith<ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceModelCopyWith<$Res> {
  factory $ServiceModelCopyWith(
          ServiceModel value, $Res Function(ServiceModel) then) =
      _$ServiceModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String? description,
      String? createdByName,
      List<BundlesServiceModel>? bundlesServicesModel,
      String? icon,
      int? categoryId,
      int? price});
}

/// @nodoc
class _$ServiceModelCopyWithImpl<$Res> implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._value, this._then);

  final ServiceModel _value;
  // ignore: unused_field
  final $Res Function(ServiceModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdByName = freezed,
    Object? bundlesServicesModel = freezed,
    Object? icon = freezed,
    Object? categoryId = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByName: createdByName == freezed
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String?,
      bundlesServicesModel: bundlesServicesModel == freezed
          ? _value.bundlesServicesModel
          : bundlesServicesModel // ignore: cast_nullable_to_non_nullable
              as List<BundlesServiceModel>?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceModelCopyWith<$Res>
    implements $ServiceModelCopyWith<$Res> {
  factory _$ServiceModelCopyWith(
          _ServiceModel value, $Res Function(_ServiceModel) then) =
      __$ServiceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String? description,
      String? createdByName,
      List<BundlesServiceModel>? bundlesServicesModel,
      String? icon,
      int? categoryId,
      int? price});
}

/// @nodoc
class __$ServiceModelCopyWithImpl<$Res> extends _$ServiceModelCopyWithImpl<$Res>
    implements _$ServiceModelCopyWith<$Res> {
  __$ServiceModelCopyWithImpl(
      _ServiceModel _value, $Res Function(_ServiceModel) _then)
      : super(_value, (v) => _then(v as _ServiceModel));

  @override
  _ServiceModel get _value => super._value as _ServiceModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdByName = freezed,
    Object? bundlesServicesModel = freezed,
    Object? icon = freezed,
    Object? categoryId = freezed,
    Object? price = freezed,
  }) {
    return _then(_ServiceModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByName: createdByName == freezed
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String?,
      bundlesServicesModel: bundlesServicesModel == freezed
          ? _value.bundlesServicesModel
          : bundlesServicesModel // ignore: cast_nullable_to_non_nullable
              as List<BundlesServiceModel>?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceModel implements _ServiceModel {
  _$_ServiceModel(
      {required this.id,
      required this.name,
      this.description,
      this.createdByName,
      this.bundlesServicesModel,
      this.icon,
      this.categoryId,
      this.price});

  factory _$_ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? createdByName;
  @override
  final List<BundlesServiceModel>? bundlesServicesModel;
  @override
  final String? icon;
  @override
  final int? categoryId;
  @override
  final int? price;

  @override
  String toString() {
    return 'ServiceModel(id: $id, name: $name, description: $description, createdByName: $createdByName, bundlesServicesModel: $bundlesServicesModel, icon: $icon, categoryId: $categoryId, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.createdByName, createdByName) ||
                const DeepCollectionEquality()
                    .equals(other.createdByName, createdByName)) &&
            (identical(other.bundlesServicesModel, bundlesServicesModel) ||
                const DeepCollectionEquality().equals(
                    other.bundlesServicesModel, bundlesServicesModel)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(createdByName) ^
      const DeepCollectionEquality().hash(bundlesServicesModel) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  _$ServiceModelCopyWith<_ServiceModel> get copyWith =>
      __$ServiceModelCopyWithImpl<_ServiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceModelToJson(this);
  }
}

abstract class _ServiceModel implements ServiceModel {
  factory _ServiceModel(
      {required int id,
      required String name,
      String? description,
      String? createdByName,
      List<BundlesServiceModel>? bundlesServicesModel,
      String? icon,
      int? categoryId,
      int? price}) = _$_ServiceModel;

  factory _ServiceModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get createdByName => throw _privateConstructorUsedError;
  @override
  List<BundlesServiceModel>? get bundlesServicesModel =>
      throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  int? get categoryId => throw _privateConstructorUsedError;
  @override
  int? get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceModelCopyWith<_ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
