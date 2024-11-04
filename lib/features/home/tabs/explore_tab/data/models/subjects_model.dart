
import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subjects_entity.dart';


part 'subjects_model.g.dart';

@JsonSerializable()
class SubjectsModel {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;

  SubjectsModel({this.icon, this.name, this.id});

  factory SubjectsModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectsModelFromJson(json);

  SubjectsEntity toSubjectEntity (){
    return SubjectsEntity(
      id: id,
      name: name,
      icon: icon,
    );
  }
}
