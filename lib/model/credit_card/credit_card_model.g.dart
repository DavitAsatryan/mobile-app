// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditCardModel _$$_CreditCardModelFromJson(Map<String, dynamic> json) =>
    _$_CreditCardModel(
      id: json['id'] as int,
      cardholderName: json['cardholderName'] as String,
      maskedNumber: json['maskedNumber'] as String,
      cardDate: json['cardDate'] as String?,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$_CreditCardModelToJson(_$_CreditCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardholderName': instance.cardholderName,
      'maskedNumber': instance.maskedNumber,
      'cardDate': instance.cardDate,
      'isDefault': instance.isDefault,
    };
