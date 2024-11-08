// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectResponseEntity _$SubjectResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SubjectResponseEntity(
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataEntity.fromJson(json['metadata'] as Map<String, dynamic>),
    );

