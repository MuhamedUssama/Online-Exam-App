// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponseModel _$SubjectResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubjectResponseModel(
      icon: json['icon'] as String?,
      name: json['name'] as String?,
      id: json['_id'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SubjectResponseModelToJson(
        SubjectResponseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'message': instance.message,
    };
