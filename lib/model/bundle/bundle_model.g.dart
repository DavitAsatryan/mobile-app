// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BundleModel _$$_BundleModelFromJson(Map<String, dynamic> json) =>
    _$_BundleModel(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as int?,
      icon: json['icon'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$_BundleModelToJson(_$_BundleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'description': instance.description,
      'services': instance.services,
      'price': instance.price,
      'icon': instance.icon,
      'category': instance.category,
    };
