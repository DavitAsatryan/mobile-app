// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryListResponse _$CategoryListResponseFromJson(Map<String, dynamic> json) {
  return _CategoryListResponse.fromJson(json);
}

/// @nodoc
class _$CategoryListResponseTearOff {
  const _$CategoryListResponseTearOff();

  _CategoryListResponse call(
      {required List<CategoryModel> categoryList, required int count}) {
    return _CategoryListResponse(
      categoryList: categoryList,
      count: count,
    );
  }

  CategoryListResponse fromJson(Map<String, Object> json) {
    return CategoryListResponse.fromJson(json);
  }
}

/// @nodoc
const $CategoryListResponse = _$CategoryListResponseTearOff();

/// @nodoc
mixin _$CategoryListResponse {
  List<CategoryModel> get categoryList => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryListResponseCopyWith<CategoryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListResponseCopyWith<$Res> {
  factory $CategoryListResponseCopyWith(CategoryListResponse value,
          $Res Function(CategoryListResponse) then) =
      _$CategoryListResponseCopyWithImpl<$Res>;
  $Res call({List<CategoryModel> categoryList, int count});
}

/// @nodoc
class _$CategoryListResponseCopyWithImpl<$Res>
    implements $CategoryListResponseCopyWith<$Res> {
  _$CategoryListResponseCopyWithImpl(this._value, this._then);

  final CategoryListResponse _value;
  // ignore: unused_field
  final $Res Function(CategoryListResponse) _then;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      categoryList: categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CategoryListResponseCopyWith<$Res>
    implements $CategoryListResponseCopyWith<$Res> {
  factory _$CategoryListResponseCopyWith(_CategoryListResponse value,
          $Res Function(_CategoryListResponse) then) =
      __$CategoryListResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<CategoryModel> categoryList, int count});
}

/// @nodoc
class __$CategoryListResponseCopyWithImpl<$Res>
    extends _$CategoryListResponseCopyWithImpl<$Res>
    implements _$CategoryListResponseCopyWith<$Res> {
  __$CategoryListResponseCopyWithImpl(
      _CategoryListResponse _value, $Res Function(_CategoryListResponse) _then)
      : super(_value, (v) => _then(v as _CategoryListResponse));

  @override
  _CategoryListResponse get _value => super._value as _CategoryListResponse;

  @override
  $Res call({
    Object? categoryList = freezed,
    Object? count = freezed,
  }) {
    return _then(_CategoryListResponse(
      categoryList: categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryListResponse implements _CategoryListResponse {
  _$_CategoryListResponse({required this.categoryList, required this.count});

  factory _$_CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryListResponseFromJson(json);

  @override
  final List<CategoryModel> categoryList;
  @override
  final int count;

  @override
  String toString() {
    return 'CategoryListResponse(categoryList: $categoryList, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryListResponse &&
            (identical(other.categoryList, categoryList) ||
                const DeepCollectionEquality()
                    .equals(other.categoryList, categoryList)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoryList) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$CategoryListResponseCopyWith<_CategoryListResponse> get copyWith =>
      __$CategoryListResponseCopyWithImpl<_CategoryListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryListResponseToJson(this);
  }
}

abstract class _CategoryListResponse implements CategoryListResponse {
  factory _CategoryListResponse(
      {required List<CategoryModel> categoryList,
      required int count}) = _$_CategoryListResponse;

  factory _CategoryListResponse.fromJson(Map<String, dynamic> json) =
      _$_CategoryListResponse.fromJson;

  @override
  List<CategoryModel> get categoryList => throw _privateConstructorUsedError;
  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoryListResponseCopyWith<_CategoryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
