// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationResponseModel _$EmailVerificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    EmailVerificationResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      stack: json['stack'] as String?,
    );
