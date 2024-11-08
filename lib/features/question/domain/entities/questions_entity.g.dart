// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsEntity _$QuestionsEntityFromJson(Map<String, dynamic> json) =>
    QuestionsEntity(
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswersEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
      id: json['_id'] as String?,
      question: json['question'] as String?,
      correct: json['correct'] as String?,
      subject: json['subject'] == null
          ? null
          : SubjectsEntity.fromJson(json['subject'] as Map<String, dynamic>),
      exam: json['exam'] == null
          ? null
          : ExamsEntity.fromJson(json['exam'] as Map<String, dynamic>),
    );
