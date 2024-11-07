// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsModel _$ExamsModelFromJson(Map<String, dynamic> json) => ExamsModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      subjectId: json['subjectId'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
      active: json['active'] as bool?,
    );

