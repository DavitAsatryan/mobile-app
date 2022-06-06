// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'help_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HelpModel _$HelpModelFromJson(Map<String, dynamic> json) {
  return _HelpModel.fromJson(json);
}

/// @nodoc
class _$HelpModelTearOff {
  const _$HelpModelTearOff();

  _HelpModel call(
      {required int id,
      required String question,
      required String answer,
      bool? isOpen}) {
    return _HelpModel(
      id: id,
      question: question,
      answer: answer,
      isOpen: isOpen,
    );
  }

  HelpModel fromJson(Map<String, Object> json) {
    return HelpModel.fromJson(json);
  }
}

/// @nodoc
const $HelpModel = _$HelpModelTearOff();

/// @nodoc
mixin _$HelpModel {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  bool? get isOpen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HelpModelCopyWith<HelpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpModelCopyWith<$Res> {
  factory $HelpModelCopyWith(HelpModel value, $Res Function(HelpModel) then) =
      _$HelpModelCopyWithImpl<$Res>;
  $Res call({int id, String question, String answer, bool? isOpen});
}

/// @nodoc
class _$HelpModelCopyWithImpl<$Res> implements $HelpModelCopyWith<$Res> {
  _$HelpModelCopyWithImpl(this._value, this._then);

  final HelpModel _value;
  // ignore: unused_field
  final $Res Function(HelpModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answer = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$HelpModelCopyWith<$Res> implements $HelpModelCopyWith<$Res> {
  factory _$HelpModelCopyWith(
          _HelpModel value, $Res Function(_HelpModel) then) =
      __$HelpModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String question, String answer, bool? isOpen});
}

/// @nodoc
class __$HelpModelCopyWithImpl<$Res> extends _$HelpModelCopyWithImpl<$Res>
    implements _$HelpModelCopyWith<$Res> {
  __$HelpModelCopyWithImpl(_HelpModel _value, $Res Function(_HelpModel) _then)
      : super(_value, (v) => _then(v as _HelpModel));

  @override
  _HelpModel get _value => super._value as _HelpModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answer = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_HelpModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HelpModel implements _HelpModel {
  _$_HelpModel(
      {required this.id,
      required this.question,
      required this.answer,
      this.isOpen});

  factory _$_HelpModel.fromJson(Map<String, dynamic> json) =>
      _$$_HelpModelFromJson(json);

  @override
  final int id;
  @override
  final String question;
  @override
  final String answer;
  @override
  final bool? isOpen;

  @override
  String toString() {
    return 'HelpModel(id: $id, question: $question, answer: $answer, isOpen: $isOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HelpModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.isOpen, isOpen) ||
                const DeepCollectionEquality().equals(other.isOpen, isOpen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(isOpen);

  @JsonKey(ignore: true)
  @override
  _$HelpModelCopyWith<_HelpModel> get copyWith =>
      __$HelpModelCopyWithImpl<_HelpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HelpModelToJson(this);
  }
}

abstract class _HelpModel implements HelpModel {
  factory _HelpModel(
      {required int id,
      required String question,
      required String answer,
      bool? isOpen}) = _$_HelpModel;

  factory _HelpModel.fromJson(Map<String, dynamic> json) =
      _$_HelpModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get question => throw _privateConstructorUsedError;
  @override
  String get answer => throw _privateConstructorUsedError;
  @override
  bool? get isOpen => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HelpModelCopyWith<_HelpModel> get copyWith =>
      throw _privateConstructorUsedError;
}
