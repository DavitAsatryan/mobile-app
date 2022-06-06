// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'help_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HelpResponseModel _$HelpResponseModelFromJson(Map<String, dynamic> json) {
  return _HelpResponseModel.fromJson(json);
}

/// @nodoc
class _$HelpResponseModelTearOff {
  const _$HelpResponseModelTearOff();

  _HelpResponseModel call(
      {required String name, required List<HelpModel> children, bool? isOpen}) {
    return _HelpResponseModel(
      name: name,
      children: children,
      isOpen: isOpen,
    );
  }

  HelpResponseModel fromJson(Map<String, Object> json) {
    return HelpResponseModel.fromJson(json);
  }
}

/// @nodoc
const $HelpResponseModel = _$HelpResponseModelTearOff();

/// @nodoc
mixin _$HelpResponseModel {
  String get name => throw _privateConstructorUsedError;
  List<HelpModel> get children => throw _privateConstructorUsedError;
  bool? get isOpen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HelpResponseModelCopyWith<HelpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpResponseModelCopyWith<$Res> {
  factory $HelpResponseModelCopyWith(
          HelpResponseModel value, $Res Function(HelpResponseModel) then) =
      _$HelpResponseModelCopyWithImpl<$Res>;
  $Res call({String name, List<HelpModel> children, bool? isOpen});
}

/// @nodoc
class _$HelpResponseModelCopyWithImpl<$Res>
    implements $HelpResponseModelCopyWith<$Res> {
  _$HelpResponseModelCopyWithImpl(this._value, this._then);

  final HelpResponseModel _value;
  // ignore: unused_field
  final $Res Function(HelpResponseModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? children = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<HelpModel>,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$HelpResponseModelCopyWith<$Res>
    implements $HelpResponseModelCopyWith<$Res> {
  factory _$HelpResponseModelCopyWith(
          _HelpResponseModel value, $Res Function(_HelpResponseModel) then) =
      __$HelpResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<HelpModel> children, bool? isOpen});
}

/// @nodoc
class __$HelpResponseModelCopyWithImpl<$Res>
    extends _$HelpResponseModelCopyWithImpl<$Res>
    implements _$HelpResponseModelCopyWith<$Res> {
  __$HelpResponseModelCopyWithImpl(
      _HelpResponseModel _value, $Res Function(_HelpResponseModel) _then)
      : super(_value, (v) => _then(v as _HelpResponseModel));

  @override
  _HelpResponseModel get _value => super._value as _HelpResponseModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? children = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_HelpResponseModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<HelpModel>,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HelpResponseModel implements _HelpResponseModel {
  _$_HelpResponseModel(
      {required this.name, required this.children, this.isOpen});

  factory _$_HelpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_HelpResponseModelFromJson(json);

  @override
  final String name;
  @override
  final List<HelpModel> children;
  @override
  final bool? isOpen;

  @override
  String toString() {
    return 'HelpResponseModel(name: $name, children: $children, isOpen: $isOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HelpResponseModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)) &&
            (identical(other.isOpen, isOpen) ||
                const DeepCollectionEquality().equals(other.isOpen, isOpen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(isOpen);

  @JsonKey(ignore: true)
  @override
  _$HelpResponseModelCopyWith<_HelpResponseModel> get copyWith =>
      __$HelpResponseModelCopyWithImpl<_HelpResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HelpResponseModelToJson(this);
  }
}

abstract class _HelpResponseModel implements HelpResponseModel {
  factory _HelpResponseModel(
      {required String name,
      required List<HelpModel> children,
      bool? isOpen}) = _$_HelpResponseModel;

  factory _HelpResponseModel.fromJson(Map<String, dynamic> json) =
      _$_HelpResponseModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<HelpModel> get children => throw _privateConstructorUsedError;
  @override
  bool? get isOpen => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HelpResponseModelCopyWith<_HelpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
