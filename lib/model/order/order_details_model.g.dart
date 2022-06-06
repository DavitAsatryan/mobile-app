// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetailsModel _$$_OrderDetailsModelFromJson(Map<String, dynamic> json) =>
    _$_OrderDetailsModel(
      id: json['id'] as int,
      createdById: json['createdById'] as int,
      createdByName: json['createdByName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: json['status'] as String,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      country: json['country'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String,
      entrance: json['entrance'] as String?,
      entranceCode: json['entranceCode'] as String?,
      floor: json['floor'] as String?,
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      patient: PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      services: (json['orderServices'] as List<dynamic>)
          .map((e) => OrderServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      transportationDetails: json['transportationDetails'] == null
          ? null
          : TransportationDetails.fromJson(
              json['transportationDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderDetailsModelToJson(
        _$_OrderDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdById': instance.createdById,
      'createdByName': instance.createdByName,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'status': instance.status,
      'appointmentDate': instance.appointmentDate.toIso8601String(),
      'user': instance.user,
      'country': instance.country,
      'city': instance.city,
      'address': instance.address,
      'entrance': instance.entrance,
      'entranceCode': instance.entranceCode,
      'floor': instance.floor,
      'payment': instance.payment,
      'patient': instance.patient,
      'orderServices': instance.services,
      'transportationDetails': instance.transportationDetails,
    };
