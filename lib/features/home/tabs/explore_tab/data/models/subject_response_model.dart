import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/data/models/metadata/metadata.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/data/models/subjects_model.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subject_response_entity.dart';
part 'subject_response_model.g.dart';

@JsonSerializable()
class SubjectResponseModel {
  List<SubjectsModel>? subjects;
  Metadata? metadata;
  String? message;

  SubjectResponseModel({this.subjects, this.message,this.metadata});

  factory SubjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseModelFromJson(json);

SubjectResponseEntity toSubjectResponseEntity (){
  return SubjectResponseEntity(
    subjects: subjects?.map((subject) => subject.toSubjectEntity(),).toList(),
        message: message,
    metadata: metadata?.toMetadataEntity()

  );
}
}
