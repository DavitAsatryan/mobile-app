// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientModel _$$_PatientModelFromJson(Map<String, dynamic> json) =>
    _$_PatientModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      defaultPicture: json['defaultPicture'] as String,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      email: json['email'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$_PatientModelToJson(_$_PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'defaultPicture': instance.defaultPicture,
      'birthDate': instance.birthDate?.toIso8601String(),
      'email': instance.email,
      'user': instance.user,
      'phone': instance.phone,
      'gender': instance.gender,
      'country': instance.country,
      'city': instance.city,
      'profilePicture': instance.profilePicture,
    };
