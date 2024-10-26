// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfoResponseModel _$ProfileInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileInfoResponseModel(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      stack: json['stack'] as String?,
      user: json['user'] == null
          ? null
          : UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
    );
