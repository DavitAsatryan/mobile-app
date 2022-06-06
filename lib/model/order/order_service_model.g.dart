// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderServiceModel _$$_OrderServiceModelFromJson(Map<String, dynamic> json) =>
    _$_OrderServiceModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      service: json['service'] == null
          ? null
          : ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      diagnosis: json['diagnosis'] as String?,
    );

Map<String, dynamic> _$$_OrderServiceModelToJson(
        _$_OrderServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'attachments': instance.attachments,
      'service': instance.service,
      'notes': instance.notes,
      'diagnosis': instance.diagnosis,
    };
