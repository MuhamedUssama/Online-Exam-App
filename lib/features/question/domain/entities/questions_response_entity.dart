import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/question/domain/entities/questions_entity.dart';

part 'questions_response_entity.g.dart';

@JsonSerializable()
class QuestionsResponseEntity{
  String? message;
List<QuestionsEntity>? questions;

  QuestionsResponseEntity({this.message, this.questions});
  factory QuestionsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseEntityFromJson(json);
}