// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsEntity _$ExamsEntityFromJson(Map<String, dynamic> json) => ExamsEntity(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      subjectId: json['subjectId'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
      active: json['active'] as bool?,
    );


