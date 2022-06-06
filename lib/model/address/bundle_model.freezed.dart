// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bundle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BundleModel _$BundleModelFromJson(Map<String, dynamic> json) {
  return _BundleModel.fromJson(json);
}

/// @nodoc
class _$BundleModelTearOff {
  const _$BundleModelTearOff();

  _BundleModel call(
      {required int id,
      required String createdAt,
      required String name,
      required String description,
      List<ServiceModel>? services,
      String? price,
      String? icon,
      String? category}) {
    return _BundleModel(
      id: id,
      createdAt: createdAt,
      name: name,
      description: description,
      services: services,
      price: price,
      icon: icon,
      category: category,
    );
  }

  BundleModel fromJson(Map<String, Object> json) {
    return BundleModel.fromJson(json);
  }
}

/// @nodoc
const $BundleModel = _$BundleModelTearOff();

/// @nodoc
mixin _$BundleModel {
  int get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<ServiceModel>? get services => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundleModelCopyWith<BundleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleModelCopyWith<$Res> {
  factory $BundleModelCopyWith(
          BundleModel value, $Res Function(BundleModel) then) =
      _$BundleModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String createdAt,
      String name,
      String description,
      List<ServiceModel>? services,
      String? price,
      String? icon,
      String? category});
}

/// @nodoc
class _$BundleModelCopyWithImpl<$Res> implements $BundleModelCopyWith<$Res> {
  _$BundleModelCopyWithImpl(this._value, this._then);

  final BundleModel _value;
  // ignore: unused_field
  final $Res Function(BundleModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? services = freezed,
    Object? price = freezed,
    Object? icon = freezed,
    Object? category = freezed,
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
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BundleModelCopyWith<$Res>
    implements $BundleModelCopyWith<$Res> {
  factory _$BundleModelCopyWith(
          _BundleModel value, $Res Function(_BundleModel) then) =
      __$BundleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String createdAt,
      String name,
      String description,
      List<ServiceModel>? services,
      String? price,
      String? icon,
      String? category});
}

/// @nodoc
class __$BundleModelCopyWithImpl<$Res> extends _$BundleModelCopyWithImpl<$Res>
    implements _$BundleModelCopyWith<$Res> {
  __$BundleModelCopyWithImpl(
      _BundleModel _value, $Res Function(_BundleModel) _then)
      : super(_value, (v) => _then(v as _BundleModel));

  @override
  _BundleModel get _value => super._value as _BundleModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? services = freezed,
    Object? price = freezed,
    Object? icon = freezed,
    Object? category = freezed,
  }) {
    return _then(_BundleModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BundleModel implements _BundleModel {
  _$_BundleModel(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.description,
      this.services,
      this.price,
      this.icon,
      this.category});

  factory _$_BundleModel.fromJson(Map<String, dynamic> json) =>
      _$$_BundleModelFromJson(json);

  @override
  final int id;
  @override
  final String createdAt;
  @override
  final String name;
  @override
  final String description;
  @override
  final List<ServiceModel>? services;
  @override
  final String? price;
  @override
  final String? icon;
  @override
  final String? category;

  @override
  String toString() {
    return 'BundleModel(id: $id, createdAt: $createdAt, name: $name, description: $description, services: $services, price: $price, icon: $icon, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BundleModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.services, services) ||
                const DeepCollectionEquality()
                    .equals(other.services, services)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(services) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(category);

  @JsonKey(ignore: true)
  @override
  _$BundleModelCopyWith<_BundleModel> get copyWith =>
      __$BundleModelCopyWithImpl<_BundleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BundleModelToJson(this);
  }
}

abstract class _BundleModel implements BundleModel {
  factory _BundleModel(
      {required int id,
      required String createdAt,
      required String name,
      required String description,
      List<ServiceModel>? services,
      String? price,
      String? icon,
      String? category}) = _$_BundleModel;

  factory _BundleModel.fromJson(Map<String, dynamic> json) =
      _$_BundleModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  List<ServiceModel>? get services => throw _privateConstructorUsedError;
  @override
  String? get price => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BundleModelCopyWith<_BundleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
