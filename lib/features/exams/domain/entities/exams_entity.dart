
import 'package:json_annotation/json_annotation.dart';


part 'exams_entity.g.dart';

@JsonSerializable()
class ExamsEntity {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  int? duration;
  String? subjectId;
  int? numberOfQuestions;
  bool? active;

  ExamsEntity({this.id,this.title,this.duration,this.subjectId,this.numberOfQuestions,this.active});

  factory ExamsEntity.fromJson(Map<String, dynamic> json) =>
      _$ExamsEntityFromJson(json);


}
