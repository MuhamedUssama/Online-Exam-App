// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordEntity _$ResetPasswordEntityFromJson(Map<String, dynamic> json) =>
    ResetPasswordEntity(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ResetPasswordEntityToJson(
        ResetPasswordEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
