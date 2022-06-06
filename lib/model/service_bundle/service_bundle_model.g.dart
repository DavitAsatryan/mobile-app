// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_bundle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BundlesServiceModel _$$_BundlesServiceModelFromJson(
        Map<String, dynamic> json) =>
    _$_BundlesServiceModel(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      bundleId: json['bundleId'] as int,
      serviceId: json['serviceId'] as int,
    );

Map<String, dynamic> _$$_BundlesServiceModelToJson(
        _$_BundlesServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'bundleId': instance.bundleId,
      'serviceId': instance.serviceId,
    };
