// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as int,
      status: json['status'] as String,
      patientName: json['patientName'] as String,
      date: DateTime.parse(json['date'] as String),
      amount: AmountModel.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'patientName': instance.patientName,
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
    };
