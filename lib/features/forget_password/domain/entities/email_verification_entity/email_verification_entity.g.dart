// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationEntity _$EmailVerificationEntityFromJson(
        Map<String, dynamic> json) =>
    EmailVerificationEntity(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      stack: json['stack'] as String?,
    );

Map<String, dynamic> _$EmailVerificationEntityToJson(
        EmailVerificationEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'stack': instance.stack,
    };
