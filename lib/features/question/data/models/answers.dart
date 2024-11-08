import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/question/domain/entities/answers_entity.dart';

part 'answers.g.dart';

@JsonSerializable()
class Answers{
  String? answer;
  String? key;
  Answers({this.answer,this.key});
  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);
  AnswersEntity toAnswersEntity (){
    return AnswersEntity(
      answer: answer,
      key: key
    );
  }
}