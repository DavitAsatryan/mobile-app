// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shipping_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShoppingCartModel _$ShoppingCartModelFromJson(Map<String, dynamic> json) {
  return _ShoppingCartModel.fromJson(json);
}

/// @nodoc
class _$ShoppingCartModelTearOff {
  const _$ShoppingCartModelTearOff();

  _ShoppingCartModel call(
      {required int id,
      required String name,
      required int price,
      String? icon}) {
    return _ShoppingCartModel(
      id: id,
      name: name,
      price: price,
      icon: icon,
    );
  }

  ShoppingCartModel fromJson(Map<String, Object> json) {
    return ShoppingCartModel.fromJson(json);
  }
}

/// @nodoc
const $ShoppingCartModel = _$ShoppingCartModelTearOff();

/// @nodoc
mixin _$ShoppingCartModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingCartModelCopyWith<ShoppingCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartModelCopyWith<$Res> {
  factory $ShoppingCartModelCopyWith(
          ShoppingCartModel value, $Res Function(ShoppingCartModel) then) =
      _$ShoppingCartModelCopyWithImpl<$Res>;
  $Res call({int id, String name, int price, String? icon});
}

/// @nodoc
class _$ShoppingCartModelCopyWithImpl<$Res>
    implements $ShoppingCartModelCopyWith<$Res> {
  _$ShoppingCartModelCopyWithImpl(this._value, this._then);

  final ShoppingCartModel _value;
  // ignore: unused_field
  final $Res Function(ShoppingCartModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? icon = freezed,
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
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ShoppingCartModelCopyWith<$Res>
    implements $ShoppingCartModelCopyWith<$Res> {
  factory _$ShoppingCartModelCopyWith(
          _ShoppingCartModel value, $Res Function(_ShoppingCartModel) then) =
      __$ShoppingCartModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int price, String? icon});
}

/// @nodoc
class __$ShoppingCartModelCopyWithImpl<$Res>
    extends _$ShoppingCartModelCopyWithImpl<$Res>
    implements _$ShoppingCartModelCopyWith<$Res> {
  __$ShoppingCartModelCopyWithImpl(
      _ShoppingCartModel _value, $Res Function(_ShoppingCartModel) _then)
      : super(_value, (v) => _then(v as _ShoppingCartModel));

  @override
  _ShoppingCartModel get _value => super._value as _ShoppingCartModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? icon = freezed,
  }) {
    return _then(_ShoppingCartModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShoppingCartModel implements _ShoppingCartModel {
  _$_ShoppingCartModel(
      {required this.id, required this.name, required this.price, this.icon});

  factory _$_ShoppingCartModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShoppingCartModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int price;
  @override
  final String? icon;

  @override
  String toString() {
    return 'ShoppingCartModel(id: $id, name: $name, price: $price, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShoppingCartModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(icon);

  @JsonKey(ignore: true)
  @override
  _$ShoppingCartModelCopyWith<_ShoppingCartModel> get copyWith =>
      __$ShoppingCartModelCopyWithImpl<_ShoppingCartModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShoppingCartModelToJson(this);
  }
}

abstract class _ShoppingCartModel implements ShoppingCartModel {
  factory _ShoppingCartModel(
      {required int id,
      required String name,
      required int price,
      String? icon}) = _$_ShoppingCartModel;

  factory _ShoppingCartModel.fromJson(Map<String, dynamic> json) =
      _$_ShoppingCartModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShoppingCartModelCopyWith<_ShoppingCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}
