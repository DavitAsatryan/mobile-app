// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transportation_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransportationDetails _$$_TransportationDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_TransportationDetails(
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      price: json['price'] as int,
      km: (json['km'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TransportationDetailsToJson(
        _$_TransportationDetails instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'duration': instance.duration,
      'price': instance.price,
      'km': instance.km,
    };
