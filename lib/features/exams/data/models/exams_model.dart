
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/exams_entity.dart';


part 'exams_model.g.dart';

@JsonSerializable()
class ExamsModel {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  int? duration;
  String? subjectId;
  int? numberOfQuestions;
  bool? active;

  ExamsModel({this.id,this.title,this.duration,this.subjectId,this.numberOfQuestions,this.active});

  factory ExamsModel.fromJson(Map<String, dynamic> json) =>
      _$ExamsModelFromJson(json);

  ExamsEntity toExamsEntity(){
    return ExamsEntity(
      id: id,
      title: title,
      duration: duration,
      subjectId: subjectId,
      numberOfQuestions: numberOfQuestions,
      active: active
    );
  }
}
