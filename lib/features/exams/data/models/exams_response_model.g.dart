// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsResponseModel _$ExamsResponseModelFromJson(Map<String, dynamic> json) =>
    ExamsResponseModel(
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

