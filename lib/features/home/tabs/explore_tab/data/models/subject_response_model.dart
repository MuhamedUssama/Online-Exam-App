import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subject_response_entity.dart';
part 'subject_response_model.g.dart';

@JsonSerializable()
class SubjectResponseModel {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;
  String? message;

  SubjectResponseModel({this.icon, this.name, this.id, this.message});

  factory SubjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseModelFromJson(json);

  SubjectResponseEntity toSubjectResponseEntity() {
    return SubjectResponseEntity(
        id: id, name: name, icon: icon, message: message);
  }
}
