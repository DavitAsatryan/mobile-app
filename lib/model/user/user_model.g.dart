// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      defaultPicture: json['defaultPicture'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
      imageUrl: json['imageUrl'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'defaultPicture': instance.defaultPicture,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'gender': instance.gender,
      'country': instance.country,
      'city': instance.city,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'birthDate': instance.birthDate?.toIso8601String(),
      'profilePicture': instance.profilePicture,
    };
