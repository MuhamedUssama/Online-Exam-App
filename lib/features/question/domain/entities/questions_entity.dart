import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams/domain/entities/exams_entity.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subjects_entity.dart';
import 'package:online_exam_app/features/question/domain/entities/answers_entity.dart';
part 'questions_entity.g.dart';

@JsonSerializable()
class QuestionsEntity {
  List<AnswersEntity>? answers;
  String? type;
  @JsonKey(name: '_id')
  String? id;
  String? question;
  String? correct;
  SubjectsEntity? subject;
  ExamsEntity? exam;

  QuestionsEntity(
      {this.answers,
      this.type,
      this.id,
      this.question,
      this.correct,
      this.subject,
      this.exam});
  factory QuestionsEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionsEntityFromJson(json);
}