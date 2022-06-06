// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RootCategoryModel _$$_RootCategoryModelFromJson(Map<String, dynamic> json) =>
    _$_RootCategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      categoryId: json['categoryId'] as int?,
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_RootCategoryModelToJson(
        _$_RootCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
      'color': instance.color,
    };
