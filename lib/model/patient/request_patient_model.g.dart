// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestPatientModel _$$_RequestPatientModelFromJson(
        Map<String, dynamic> json) =>
    _$_RequestPatientModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$_RequestPatientModelToJson(
    _$_RequestPatientModel instance) {
  final val = <String, dynamic>{
    'firstName': instance.firstName,
    'lastName': instance.lastName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('birthDate', instance.birthDate?.toIso8601String());
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('gender', instance.gender);
  writeNotNull('country', instance.country);
  writeNotNull('city', instance.city);
  return val;
}
