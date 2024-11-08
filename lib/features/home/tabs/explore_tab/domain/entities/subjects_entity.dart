import 'package:json_annotation/json_annotation.dart';
part 'subjects_entity.g.dart';
@JsonSerializable()
class SubjectsEntity {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;

  SubjectsEntity({this.icon, this.name, this.id});

  factory SubjectsEntity.fromJson(Map<String, dynamic> json) =>
      _$SubjectsEntityFromJson(json);

}
