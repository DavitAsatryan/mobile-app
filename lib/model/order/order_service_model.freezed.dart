// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderServiceModel _$OrderServiceModelFromJson(Map<String, dynamic> json) {
  return _OrderServiceModel.fromJson(json);
}

/// @nodoc
class _$OrderServiceModelTearOff {
  const _$OrderServiceModelTearOff();

  _OrderServiceModel call(
      {required int id,
      required DateTime createdAt,
      required String status,
      required List<String> attachments,
      ServiceModel? service,
      String? notes,
      String? diagnosis}) {
    return _OrderServiceModel(
      id: id,
      createdAt: createdAt,
      status: status,
      attachments: attachments,
      service: service,
      notes: notes,
      diagnosis: diagnosis,
    );
  }

  OrderServiceModel fromJson(Map<String, Object> json) {
    return OrderServiceModel.fromJson(json);
  }
}

/// @nodoc
const $OrderServiceModel = _$OrderServiceModelTearOff();

/// @nodoc
mixin _$OrderServiceModel {
  int get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;
  ServiceModel? get service => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get diagnosis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderServiceModelCopyWith<OrderServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderServiceModelCopyWith<$Res> {
  factory $OrderServiceModelCopyWith(
          OrderServiceModel value, $Res Function(OrderServiceModel) then) =
      _$OrderServiceModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      DateTime createdAt,
      String status,
      List<String> attachments,
      ServiceModel? service,
      String? notes,
      String? diagnosis});

  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class _$OrderServiceModelCopyWithImpl<$Res>
    implements $OrderServiceModelCopyWith<$Res> {
  _$OrderServiceModelCopyWithImpl(this._value, this._then);

  final OrderServiceModel _value;
  // ignore: unused_field
  final $Res Function(OrderServiceModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? attachments = freezed,
    Object? service = freezed,
    Object? notes = freezed,
    Object? diagnosis = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      diagnosis: diagnosis == freezed
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ServiceModelCopyWith<$Res>? get service {
    if (_value.service == null) {
      return null;
    }

    return $ServiceModelCopyWith<$Res>(_value.service!, (value) {
      return _then(_value.copyWith(service: value));
    });
  }
}

/// @nodoc
abstract class _$OrderServiceModelCopyWith<$Res>
    implements $OrderServiceModelCopyWith<$Res> {
  factory _$OrderServiceModelCopyWith(
          _OrderServiceModel value, $Res Function(_OrderServiceModel) then) =
      __$OrderServiceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      DateTime createdAt,
      String status,
      List<String> attachments,
      ServiceModel? service,
      String? notes,
      String? diagnosis});

  @override
  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class __$OrderServiceModelCopyWithImpl<$Res>
    extends _$OrderServiceModelCopyWithImpl<$Res>
    implements _$OrderServiceModelCopyWith<$Res> {
  __$OrderServiceModelCopyWithImpl(
      _OrderServiceModel _value, $Res Function(_OrderServiceModel) _then)
      : super(_value, (v) => _then(v as _OrderServiceModel));

  @override
  _OrderServiceModel get _value => super._value as _OrderServiceModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? attachments = freezed,
    Object? service = freezed,
    Object? notes = freezed,
    Object? diagnosis = freezed,
  }) {
    return _then(_OrderServiceModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      diagnosis: diagnosis == freezed
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderServiceModel implements _OrderServiceModel {
  _$_OrderServiceModel(
      {required this.id,
      required this.createdAt,
      required this.status,
      required this.attachments,
      this.service,
      this.notes,
      this.diagnosis});

  factory _$_OrderServiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderServiceModelFromJson(json);

  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final String status;
  @override
  final List<String> attachments;
  @override
  final ServiceModel? service;
  @override
  final String? notes;
  @override
  final String? diagnosis;

  @override
  String toString() {
    return 'OrderServiceModel(id: $id, createdAt: $createdAt, status: $status, attachments: $attachments, service: $service, notes: $notes, diagnosis: $diagnosis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderServiceModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality()
                    .equals(other.attachments, attachments)) &&
            (identical(other.service, service) ||
                const DeepCollectionEquality()
                    .equals(other.service, service)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(service) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(diagnosis);

  @JsonKey(ignore: true)
  @override
  _$OrderServiceModelCopyWith<_OrderServiceModel> get copyWith =>
      __$OrderServiceModelCopyWithImpl<_OrderServiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderServiceModelToJson(this);
  }
}

abstract class _OrderServiceModel implements OrderServiceModel {
  factory _OrderServiceModel(
      {required int id,
      required DateTime createdAt,
      required String status,
      required List<String> attachments,
      ServiceModel? service,
      String? notes,
      String? diagnosis}) = _$_OrderServiceModel;

  factory _OrderServiceModel.fromJson(Map<String, dynamic> json) =
      _$_OrderServiceModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  List<String> get attachments => throw _privateConstructorUsedError;
  @override
  ServiceModel? get service => throw _privateConstructorUsedError;
  @override
  String? get notes => throw _privateConstructorUsedError;
  @override
  String? get diagnosis => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderServiceModelCopyWith<_OrderServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
