// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsResponseEntity _$ExamsResponseEntityFromJson(Map<String, dynamic> json) =>
    ExamsResponseEntity(
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataEntity.fromJson(json['metadata'] as Map<String, dynamic>),
    );
