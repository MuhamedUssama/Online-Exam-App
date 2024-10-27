import 'package:json_annotation/json_annotation.dart';
part 'subject_response_entity.g.dart';

@JsonSerializable()
class SubjectResponseEntity {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;
  String? message;

  SubjectResponseEntity({this.icon, this.name, this.id, this.message});

  factory SubjectResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseEntityFromJson(json);
}
