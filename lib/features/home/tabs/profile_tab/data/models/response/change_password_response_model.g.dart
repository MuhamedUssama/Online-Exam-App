// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponseModel _$ChangePasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponseModel(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      stack: json['stack'] as String?,
      token: json['token'] as String?,
    );