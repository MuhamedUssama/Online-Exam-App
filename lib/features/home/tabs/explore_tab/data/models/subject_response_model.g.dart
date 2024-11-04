// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponseModel _$SubjectResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubjectResponseModel(
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

