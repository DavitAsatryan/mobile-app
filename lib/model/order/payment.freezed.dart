// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
class _$PaymentTearOff {
  const _$PaymentTearOff();

  _Payment call(
      {required int id,
      required DateTime createdAt,
      required String method,
      required String status,
      required int discount,
      required int transportationPrice,
      required int totalPrice,
      required int amountPaid,
      required String currency,
      int? orderPrice,
      String? system}) {
    return _Payment(
      id: id,
      createdAt: createdAt,
      method: method,
      status: status,
      discount: discount,
      transportationPrice: transportationPrice,
      totalPrice: totalPrice,
      amountPaid: amountPaid,
      currency: currency,
      orderPrice: orderPrice,
      system: system,
    );
  }

  Payment fromJson(Map<String, Object> json) {
    return Payment.fromJson(json);
  }
}

/// @nodoc
const $Payment = _$PaymentTearOff();

/// @nodoc
mixin _$Payment {
  int get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  int get transportationPrice => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  int get amountPaid => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int? get orderPrice => throw _privateConstructorUsedError;
  String? get system => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res>;
  $Res call(
      {int id,
      DateTime createdAt,
      String method,
      String status,
      int discount,
      int transportationPrice,
      int totalPrice,
      int amountPaid,
      String currency,
      int? orderPrice,
      String? system});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res> implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  final Payment _value;
  // ignore: unused_field
  final $Res Function(Payment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? method = freezed,
    Object? status = freezed,
    Object? discount = freezed,
    Object? transportationPrice = freezed,
    Object? totalPrice = freezed,
    Object? amountPaid = freezed,
    Object? currency = freezed,
    Object? orderPrice = freezed,
    Object? system = freezed,
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
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      transportationPrice: transportationPrice == freezed
          ? _value.transportationPrice
          : transportationPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      amountPaid: amountPaid == freezed
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as int,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      orderPrice: orderPrice == freezed
          ? _value.orderPrice
          : orderPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) then) =
      __$PaymentCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      DateTime createdAt,
      String method,
      String status,
      int discount,
      int transportationPrice,
      int totalPrice,
      int amountPaid,
      String currency,
      int? orderPrice,
      String? system});
}

/// @nodoc
class __$PaymentCopyWithImpl<$Res> extends _$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(_Payment _value, $Res Function(_Payment) _then)
      : super(_value, (v) => _then(v as _Payment));

  @override
  _Payment get _value => super._value as _Payment;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? method = freezed,
    Object? status = freezed,
    Object? discount = freezed,
    Object? transportationPrice = freezed,
    Object? totalPrice = freezed,
    Object? amountPaid = freezed,
    Object? currency = freezed,
    Object? orderPrice = freezed,
    Object? system = freezed,
  }) {
    return _then(_Payment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      transportationPrice: transportationPrice == freezed
          ? _value.transportationPrice
          : transportationPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      amountPaid: amountPaid == freezed
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as int,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      orderPrice: orderPrice == freezed
          ? _value.orderPrice
          : orderPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      system: system == freezed
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Payment implements _Payment {
  _$_Payment(
      {required this.id,
      required this.createdAt,
      required this.method,
      required this.status,
      required this.discount,
      required this.transportationPrice,
      required this.totalPrice,
      required this.amountPaid,
      required this.currency,
      this.orderPrice,
      this.system});

  factory _$_Payment.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentFromJson(json);

  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final String method;
  @override
  final String status;
  @override
  final int discount;
  @override
  final int transportationPrice;
  @override
  final int totalPrice;
  @override
  final int amountPaid;
  @override
  final String currency;
  @override
  final int? orderPrice;
  @override
  final String? system;

  @override
  String toString() {
    return 'Payment(id: $id, createdAt: $createdAt, method: $method, status: $status, discount: $discount, transportationPrice: $transportationPrice, totalPrice: $totalPrice, amountPaid: $amountPaid, currency: $currency, orderPrice: $orderPrice, system: $system)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Payment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.method, method) ||
                const DeepCollectionEquality().equals(other.method, method)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.discount, discount) ||
                const DeepCollectionEquality()
                    .equals(other.discount, discount)) &&
            (identical(other.transportationPrice, transportationPrice) ||
                const DeepCollectionEquality()
                    .equals(other.transportationPrice, transportationPrice)) &&
            (identical(other.totalPrice, totalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalPrice, totalPrice)) &&
            (identical(other.amountPaid, amountPaid) ||
                const DeepCollectionEquality()
                    .equals(other.amountPaid, amountPaid)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)) &&
            (identical(other.orderPrice, orderPrice) ||
                const DeepCollectionEquality()
                    .equals(other.orderPrice, orderPrice)) &&
            (identical(other.system, system) ||
                const DeepCollectionEquality().equals(other.system, system)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(method) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(discount) ^
      const DeepCollectionEquality().hash(transportationPrice) ^
      const DeepCollectionEquality().hash(totalPrice) ^
      const DeepCollectionEquality().hash(amountPaid) ^
      const DeepCollectionEquality().hash(currency) ^
      const DeepCollectionEquality().hash(orderPrice) ^
      const DeepCollectionEquality().hash(system);

  @JsonKey(ignore: true)
  @override
  _$PaymentCopyWith<_Payment> get copyWith =>
      __$PaymentCopyWithImpl<_Payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentToJson(this);
  }
}

abstract class _Payment implements Payment {
  factory _Payment(
      {required int id,
      required DateTime createdAt,
      required String method,
      required String status,
      required int discount,
      required int transportationPrice,
      required int totalPrice,
      required int amountPaid,
      required String currency,
      int? orderPrice,
      String? system}) = _$_Payment;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$_Payment.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  String get method => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get discount => throw _privateConstructorUsedError;
  @override
  int get transportationPrice => throw _privateConstructorUsedError;
  @override
  int get totalPrice => throw _privateConstructorUsedError;
  @override
  int get amountPaid => throw _privateConstructorUsedError;
  @override
  String get currency => throw _privateConstructorUsedError;
  @override
  int? get orderPrice => throw _privateConstructorUsedError;
  @override
  String? get system => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaymentCopyWith<_Payment> get copyWith =>
      throw _privateConstructorUsedError;
}
