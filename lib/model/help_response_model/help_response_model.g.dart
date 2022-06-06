// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HelpResponseModel _$$_HelpResponseModelFromJson(Map<String, dynamic> json) =>
    _$_HelpResponseModel(
      name: json['name'] as String,
      children: (json['children'] as List<dynamic>)
          .map((e) => HelpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOpen: json['isOpen'] as bool?,
    );

Map<String, dynamic> _$$_HelpResponseModelToJson(
        _$_HelpResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'children': instance.children,
      'isOpen': instance.isOpen,
    };
