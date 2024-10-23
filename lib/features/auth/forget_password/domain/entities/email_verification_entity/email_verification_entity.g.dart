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
