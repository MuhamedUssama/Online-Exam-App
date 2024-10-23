// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      id: json['_id'] as String?,
      isVerified: json['isVerified'] as bool?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'isVerified': instance.isVerified,
    };
