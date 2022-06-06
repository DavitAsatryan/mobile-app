// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
    };
