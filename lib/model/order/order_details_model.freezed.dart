// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDetailsModel _$OrderDetailsModelFromJson(Map<String, dynamic> json) {
  return _OrderDetailsModel.fromJson(json);
}

/// @nodoc
class _$OrderDetailsModelTearOff {
  const _$OrderDetailsModelTearOff();

  _OrderDetailsModel call(
      {required int id,
      required int createdById,
      required String createdByName,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String status,
      required DateTime appointmentDate,
      required UserModel user,
      String? country,
      String? city,
      required String address,
      String? entrance,
      String? entranceCode,
      String? floor,
      required Payment payment,
      required PatientModel patient,
      @JsonKey(name: 'orderServices') required List<OrderServiceModel> services,
      TransportationDetails? transportationDetails}) {
    return _OrderDetailsModel(
      id: id,
      createdById: createdById,
      createdByName: createdByName,
      createdAt: createdAt,
      updatedAt: updatedAt,
      status: status,
      appointmentDate: appointmentDate,
      user: user,
      country: country,
      city: city,
      address: address,
      entrance: entrance,
      entranceCode: entranceCode,
      floor: floor,
      payment: payment,
      patient: patient,
      services: services,
      transportationDetails: transportationDetails,
    );
  }

  OrderDetailsModel fromJson(Map<String, Object> json) {
    return OrderDetailsModel.fromJson(json);
  }
}

/// @nodoc
const $OrderDetailsModel = _$OrderDetailsModelTearOff();

/// @nodoc
mixin _$OrderDetailsModel {
  int get id => throw _privateConstructorUsedError;
  int get createdById => throw _privateConstructorUsedError;
  String get createdByName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get appointmentDate => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get entrance => throw _privateConstructorUsedError;
  String? get entranceCode => throw _privateConstructorUsedError;
  String? get floor => throw _privateConstructorUsedError;
  Payment get payment => throw _privateConstructorUsedError;
  PatientModel get patient => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderServices')
  List<OrderServiceModel> get services => throw _privateConstructorUsedError;
  TransportationDetails? get transportationDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailsModelCopyWith<OrderDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsModelCopyWith<$Res> {
  factory $OrderDetailsModelCopyWith(
          OrderDetailsModel value, $Res Function(OrderDetailsModel) then) =
      _$OrderDetailsModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int createdById,
      String createdByName,
      DateTime createdAt,
      DateTime updatedAt,
      String status,
      DateTime appointmentDate,
      UserModel user,
      String? country,
      String? city,
      String address,
      String? entrance,
      String? entranceCode,
      String? floor,
      Payment payment,
      PatientModel patient,
      @JsonKey(name: 'orderServices') List<OrderServiceModel> services,
      TransportationDetails? transportationDetails});

  $UserModelCopyWith<$Res> get user;
  $PaymentCopyWith<$Res> get payment;
  $PatientModelCopyWith<$Res> get patient;
  $TransportationDetailsCopyWith<$Res>? get transportationDetails;
}

/// @nodoc
class _$OrderDetailsModelCopyWithImpl<$Res>
    implements $OrderDetailsModelCopyWith<$Res> {
  _$OrderDetailsModelCopyWithImpl(this._value, this._then);

  final OrderDetailsModel _value;
  // ignore: unused_field
  final $Res Function(OrderDetailsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdById = freezed,
    Object? createdByName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? status = freezed,
    Object? appointmentDate = freezed,
    Object? user = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? address = freezed,
    Object? entrance = freezed,
    Object? entranceCode = freezed,
    Object? floor = freezed,
    Object? payment = freezed,
    Object? patient = freezed,
    Object? services = freezed,
    Object? transportationDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: createdById == freezed
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdByName: createdByName == freezed
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDate: appointmentDate == freezed
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      entrance: entrance == freezed
          ? _value.entrance
          : entrance // ignore: cast_nullable_to_non_nullable
              as String?,
      entranceCode: entranceCode == freezed
          ? _value.entranceCode
          : entranceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: floor == freezed
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientModel,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<OrderServiceModel>,
      transportationDetails: transportationDetails == freezed
          ? _value.transportationDetails
          : transportationDetails // ignore: cast_nullable_to_non_nullable
              as TransportationDetails?,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $PaymentCopyWith<$Res> get payment {
    return $PaymentCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value));
    });
  }

  @override
  $PatientModelCopyWith<$Res> get patient {
    return $PatientModelCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value));
    });
  }

  @override
  $TransportationDetailsCopyWith<$Res>? get transportationDetails {
    if (_value.transportationDetails == null) {
      return null;
    }

    return $TransportationDetailsCopyWith<$Res>(_value.transportationDetails!,
        (value) {
      return _then(_value.copyWith(transportationDetails: value));
    });
  }
}

/// @nodoc
abstract class _$OrderDetailsModelCopyWith<$Res>
    implements $OrderDetailsModelCopyWith<$Res> {
  factory _$OrderDetailsModelCopyWith(
          _OrderDetailsModel value, $Res Function(_OrderDetailsModel) then) =
      __$OrderDetailsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int createdById,
      String createdByName,
      DateTime createdAt,
      DateTime updatedAt,
      String status,
      DateTime appointmentDate,
      UserModel user,
      String? country,
      String? city,
      String address,
      String? entrance,
      String? entranceCode,
      String? floor,
      Payment payment,
      PatientModel patient,
      @JsonKey(name: 'orderServices') List<OrderServiceModel> services,
      TransportationDetails? transportationDetails});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $PaymentCopyWith<$Res> get payment;
  @override
  $PatientModelCopyWith<$Res> get patient;
  @override
  $TransportationDetailsCopyWith<$Res>? get transportationDetails;
}

/// @nodoc
class __$OrderDetailsModelCopyWithImpl<$Res>
    extends _$OrderDetailsModelCopyWithImpl<$Res>
    implements _$OrderDetailsModelCopyWith<$Res> {
  __$OrderDetailsModelCopyWithImpl(
      _OrderDetailsModel _value, $Res Function(_OrderDetailsModel) _then)
      : super(_value, (v) => _then(v as _OrderDetailsModel));

  @override
  _OrderDetailsModel get _value => super._value as _OrderDetailsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdById = freezed,
    Object? createdByName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? status = freezed,
    Object? appointmentDate = freezed,
    Object? user = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? address = freezed,
    Object? entrance = freezed,
    Object? entranceCode = freezed,
    Object? floor = freezed,
    Object? payment = freezed,
    Object? patient = freezed,
    Object? services = freezed,
    Object? transportationDetails = freezed,
  }) {
    return _then(_OrderDetailsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: createdById == freezed
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdByName: createdByName == freezed
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDate: appointmentDate == freezed
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      entrance: entrance == freezed
          ? _value.entrance
          : entrance // ignore: cast_nullable_to_non_nullable
              as String?,
      entranceCode: entranceCode == freezed
          ? _value.entranceCode
          : entranceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: floor == freezed
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      payment: payment == freezed
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      patient: patient == freezed
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientModel,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<OrderServiceModel>,
      transportationDetails: transportationDetails == freezed
          ? _value.transportationDetails
          : transportationDetails // ignore: cast_nullable_to_non_nullable
              as TransportationDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetailsModel implements _OrderDetailsModel {
  _$_OrderDetailsModel(
      {required this.id,
      required this.createdById,
      required this.createdByName,
      required this.createdAt,
      required this.updatedAt,
      required this.status,
      required this.appointmentDate,
      required this.user,
      this.country,
      this.city,
      required this.address,
      this.entrance,
      this.entranceCode,
      this.floor,
      required this.payment,
      required this.patient,
      @JsonKey(name: 'orderServices') required this.services,
      this.transportationDetails});

  factory _$_OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailsModelFromJson(json);

  @override
  final int id;
  @override
  final int createdById;
  @override
  final String createdByName;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String status;
  @override
  final DateTime appointmentDate;
  @override
  final UserModel user;
  @override
  final String? country;
  @override
  final String? city;
  @override
  final String address;
  @override
  final String? entrance;
  @override
  final String? entranceCode;
  @override
  final String? floor;
  @override
  final Payment payment;
  @override
  final PatientModel patient;
  @override
  @JsonKey(name: 'orderServices')
  final List<OrderServiceModel> services;
  @override
  final TransportationDetails? transportationDetails;

  @override
  String toString() {
    return 'OrderDetailsModel(id: $id, createdById: $createdById, createdByName: $createdByName, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, appointmentDate: $appointmentDate, user: $user, country: $country, city: $city, address: $address, entrance: $entrance, entranceCode: $entranceCode, floor: $floor, payment: $payment, patient: $patient, services: $services, transportationDetails: $transportationDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderDetailsModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdById, createdById) ||
                const DeepCollectionEquality()
                    .equals(other.createdById, createdById)) &&
            (identical(other.createdByName, createdByName) ||
                const DeepCollectionEquality()
                    .equals(other.createdByName, createdByName)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.appointmentDate, appointmentDate) ||
                const DeepCollectionEquality()
                    .equals(other.appointmentDate, appointmentDate)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.entrance, entrance) ||
                const DeepCollectionEquality()
                    .equals(other.entrance, entrance)) &&
            (identical(other.entranceCode, entranceCode) ||
                const DeepCollectionEquality()
                    .equals(other.entranceCode, entranceCode)) &&
            (identical(other.floor, floor) ||
                const DeepCollectionEquality().equals(other.floor, floor)) &&
            (identical(other.payment, payment) ||
                const DeepCollectionEquality()
                    .equals(other.payment, payment)) &&
            (identical(other.patient, patient) ||
                const DeepCollectionEquality()
                    .equals(other.patient, patient)) &&
            (identical(other.services, services) ||
                const DeepCollectionEquality()
                    .equals(other.services, services)) &&
            (identical(other.transportationDetails, transportationDetails) ||
                const DeepCollectionEquality().equals(
                    other.transportationDetails, transportationDetails)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdById) ^
      const DeepCollectionEquality().hash(createdByName) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(appointmentDate) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(entrance) ^
      const DeepCollectionEquality().hash(entranceCode) ^
      const DeepCollectionEquality().hash(floor) ^
      const DeepCollectionEquality().hash(payment) ^
      const DeepCollectionEquality().hash(patient) ^
      const DeepCollectionEquality().hash(services) ^
      const DeepCollectionEquality().hash(transportationDetails);

  @JsonKey(ignore: true)
  @override
  _$OrderDetailsModelCopyWith<_OrderDetailsModel> get copyWith =>
      __$OrderDetailsModelCopyWithImpl<_OrderDetailsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailsModelToJson(this);
  }
}

abstract class _OrderDetailsModel implements OrderDetailsModel {
  factory _OrderDetailsModel(
      {required int id,
      required int createdById,
      required String createdByName,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String status,
      required DateTime appointmentDate,
      required UserModel user,
      String? country,
      String? city,
      required String address,
      String? entrance,
      String? entranceCode,
      String? floor,
      required Payment payment,
      required PatientModel patient,
      @JsonKey(name: 'orderServices') required List<OrderServiceModel> services,
      TransportationDetails? transportationDetails}) = _$_OrderDetailsModel;

  factory _OrderDetailsModel.fromJson(Map<String, dynamic> json) =
      _$_OrderDetailsModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get createdById => throw _privateConstructorUsedError;
  @override
  String get createdByName => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  DateTime get appointmentDate => throw _privateConstructorUsedError;
  @override
  UserModel get user => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  String? get city => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String? get entrance => throw _privateConstructorUsedError;
  @override
  String? get entranceCode => throw _privateConstructorUsedError;
  @override
  String? get floor => throw _privateConstructorUsedError;
  @override
  Payment get payment => throw _privateConstructorUsedError;
  @override
  PatientModel get patient => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'orderServices')
  List<OrderServiceModel> get services => throw _privateConstructorUsedError;
  @override
  TransportationDetails? get transportationDetails =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderDetailsModelCopyWith<_OrderDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
