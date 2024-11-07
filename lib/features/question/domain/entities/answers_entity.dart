import 'package:json_annotation/json_annotation.dart';

part 'answers_entity.g.dart';

@JsonSerializable()
class AnswersEntity{
  String? answer;
  String? key;
  AnswersEntity({this.answer,this.key});
  factory AnswersEntity.fromJson(Map<String, dynamic> json) =>
      _$AnswersEntityFromJson(json);
}