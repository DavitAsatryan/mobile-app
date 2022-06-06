// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'root_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RootCategoryModel _$RootCategoryModelFromJson(Map<String, dynamic> json) {
  return _RootCategoryModel.fromJson(json);
}

/// @nodoc
class _$RootCategoryModelTearOff {
  const _$RootCategoryModelTearOff();

  _RootCategoryModel call(
      {required int id,
      required String name,
      String? description,
      int? categoryId,
      String? icon,
      String? createdAt,
      String? color}) {
    return _RootCategoryModel(
      id: id,
      name: name,
      description: description,
      categoryId: categoryId,
      icon: icon,
      createdAt: createdAt,
      color: color,
    );
  }

  RootCategoryModel fromJson(Map<String, Object> json) {
    return RootCategoryModel.fromJson(json);
  }
}

/// @nodoc
const $RootCategoryModel = _$RootCategoryModelTearOff();

/// @nodoc
mixin _$RootCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RootCategoryModelCopyWith<RootCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootCategoryModelCopyWith<$Res> {
  factory $RootCategoryModelCopyWith(
          RootCategoryModel value, $Res Function(RootCategoryModel) then) =
      _$RootCategoryModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String? description,
      int? categoryId,
      String? icon,
      String? createdAt,
      String? color});
}

/// @nodoc
class _$RootCategoryModelCopyWithImpl<$Res>
    implements $RootCategoryModelCopyWith<$Res> {
  _$RootCategoryModelCopyWithImpl(this._value, this._then);

  final RootCategoryModel _value;
  // ignore: unused_field
  final $Res Function(RootCategoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? icon = freezed,
    Object? createdAt = freezed,
    Object? color = freezed,
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
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RootCategoryModelCopyWith<$Res>
    implements $RootCategoryModelCopyWith<$Res> {
  factory _$RootCategoryModelCopyWith(
          _RootCategoryModel value, $Res Function(_RootCategoryModel) then) =
      __$RootCategoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String? description,
      int? categoryId,
      String? icon,
      String? createdAt,
      String? color});
}

/// @nodoc
class __$RootCategoryModelCopyWithImpl<$Res>
    extends _$RootCategoryModelCopyWithImpl<$Res>
    implements _$RootCategoryModelCopyWith<$Res> {
  __$RootCategoryModelCopyWithImpl(
      _RootCategoryModel _value, $Res Function(_RootCategoryModel) _then)
      : super(_value, (v) => _then(v as _RootCategoryModel));

  @override
  _RootCategoryModel get _value => super._value as _RootCategoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? icon = freezed,
    Object? createdAt = freezed,
    Object? color = freezed,
  }) {
    return _then(_RootCategoryModel(
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
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RootCategoryModel implements _RootCategoryModel {
  _$_RootCategoryModel(
      {required this.id,
      required this.name,
      this.description,
      this.categoryId,
      this.icon,
      this.createdAt,
      this.color});

  factory _$_RootCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_RootCategoryModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int? categoryId;
  @override
  final String? icon;
  @override
  final String? createdAt;
  @override
  final String? color;

  @override
  String toString() {
    return 'RootCategoryModel(id: $id, name: $name, description: $description, categoryId: $categoryId, icon: $icon, createdAt: $createdAt, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RootCategoryModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  _$RootCategoryModelCopyWith<_RootCategoryModel> get copyWith =>
      __$RootCategoryModelCopyWithImpl<_RootCategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RootCategoryModelToJson(this);
  }
}

abstract class _RootCategoryModel implements RootCategoryModel {
  factory _RootCategoryModel(
      {required int id,
      required String name,
      String? description,
      int? categoryId,
      String? icon,
      String? createdAt,
      String? color}) = _$_RootCategoryModel;

  factory _RootCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_RootCategoryModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  int? get categoryId => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RootCategoryModelCopyWith<_RootCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
