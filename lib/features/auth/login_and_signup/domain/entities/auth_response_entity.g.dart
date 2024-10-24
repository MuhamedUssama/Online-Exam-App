// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseEntity _$AuthResponseEntityFromJson(Map<String, dynamic> json) =>
    AuthResponseEntity(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserResponseEntity.fromJson(json['user'] as Map<String, dynamic>),
    );
