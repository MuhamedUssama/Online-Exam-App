// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsResponseModel _$QuestionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    QuestionsResponseModel(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

