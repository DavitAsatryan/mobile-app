// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HelpModel _$$_HelpModelFromJson(Map<String, dynamic> json) => _$_HelpModel(
      id: json['id'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
      isOpen: json['isOpen'] as bool?,
    );

Map<String, dynamic> _$$_HelpModelToJson(_$_HelpModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'isOpen': instance.isOpen,
    };
