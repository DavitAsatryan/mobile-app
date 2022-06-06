// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      id: json['id'] as int?,
      zipCode: json['zipCode'] as String?,
      country: json['country'] as String?,
      floor: json['floor'] as String?,
      city: json['city'] as String?,
      isDefault: json['isDefault'] as bool?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      entranceCode: json['entranceCode'] as String?,
      entrance: json['entrance'] as String?,
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'zipCode': instance.zipCode,
      'country': instance.country,
      'floor': instance.floor,
      'city': instance.city,
      'isDefault': instance.isDefault,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'entranceCode': instance.entranceCode,
      'entrance': instance.entrance,
    };
