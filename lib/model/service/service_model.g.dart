// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceModel _$$_ServiceModelFromJson(Map<String, dynamic> json) =>
    _$_ServiceModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdByName: json['createdByName'] as String?,
      bundlesServicesModel: (json['bundlesServicesModel'] as List<dynamic>?)
          ?.map((e) => BundlesServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      icon: json['icon'] as String?,
      categoryId: json['categoryId'] as int?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$_ServiceModelToJson(_$_ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdByName': instance.createdByName,
      'bundlesServicesModel': instance.bundlesServicesModel,
      'icon': instance.icon,
      'categoryId': instance.categoryId,
      'price': instance.price,
    };
