import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/exams/domain/entities/exams_entity.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subjects_entity.dart';
import 'package:online_exam_app/features/question/data/models/answers.dart';
import 'package:online_exam_app/features/question/domain/entities/questions_entity.dart';
part 'questions_model.g.dart';

@JsonSerializable()
class QuestionsModel {
  List<Answers>? answers;
  String? type;
  @JsonKey(name: '_id')
  String? id;
  String? question;
  String? correct;
  SubjectsEntity? subject;
  ExamsEntity? exam;

  QuestionsModel(
      {this.answers,
      this.type,
      this.id,
      this.question,
      this.correct,
      this.subject,
      this.exam});
  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);
  QuestionsEntity toQuestionsEntity(){
    return QuestionsEntity(
      id: id,
      answers: answers?.map((e) => e.toAnswersEntity()).toList(),
      correct: correct,
      exam: exam,
      question: question,
      subject: subject,
      type: type,
    );
  }
}