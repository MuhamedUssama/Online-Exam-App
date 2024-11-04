import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/metadata/metadata_entity.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subjects_entity.dart';

part 'subject_response_entity.g.dart';

@JsonSerializable()
class SubjectResponseEntity {
  String? message;
  List<SubjectsEntity>? subjects;
  MetadataEntity? metadata;

  SubjectResponseEntity({this.subjects, this.message,this.metadata});

  factory SubjectResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseEntityFromJson(json);
}
