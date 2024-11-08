import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/question/data/models/questions_model.dart';
import 'package:online_exam_app/features/question/domain/entities/questions_response_entity.dart';

part 'questions_response_model.g.dart';

@JsonSerializable()
class QuestionsResponseModel{
  String? message;
List<QuestionsModel>? questions;

  QuestionsResponseModel({this.message, this.questions});
  factory QuestionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseModelFromJson(json);
  QuestionsResponseEntity toQuestionsResponseEntity (){
    return QuestionsResponseEntity(
      message: message,
      questions: questions?.map((e) => e.toQuestionsEntity(),).toList(),
    );
  }
}