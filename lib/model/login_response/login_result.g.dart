// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResult _$$_LoginResultFromJson(Map<String, dynamic> json) =>
    _$_LoginResult(
      jwtToken: json['jwtToken'] as String,
      refreshKey: json['refreshKey'] as String,
    );

Map<String, dynamic> _$$_LoginResultToJson(_$_LoginResult instance) =>
    <String, dynamic>{
      'jwtToken': instance.jwtToken,
      'refreshKey': instance.refreshKey,
    };
