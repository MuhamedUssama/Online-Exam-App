// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsResponseEntity _$QuestionsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    QuestionsResponseEntity(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

