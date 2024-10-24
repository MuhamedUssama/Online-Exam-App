// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordEntity _$ChangePasswordEntityFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordEntity(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      stack: json['stack'] as String?,
      token: json['token'] as String?,
    );
