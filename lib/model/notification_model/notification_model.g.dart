// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as int,
      fullText: json['fullText'] as String,
      title: json['title'] as String,
      action: json['action'] as String?,
      resource: json['resource'] as String?,
      entity: json['entity'] as int?,
      acknowledged: json['acknowledged'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullText': instance.fullText,
      'title': instance.title,
      'action': instance.action,
      'resource': instance.resource,
      'entity': instance.entity,
      'acknowledged': instance.acknowledged,
      'createdAt': instance.createdAt.toIso8601String(),
    };
