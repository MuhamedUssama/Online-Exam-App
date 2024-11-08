import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/metadata/metadata_entity.dart';

import 'exams_entity.dart';

part 'exams_response_entity.g.dart';

@JsonSerializable()
class ExamsResponseEntity {
  String? message;
  List<ExamsEntity>? exams;
  MetadataEntity? metadata;

  ExamsResponseEntity({this.exams, this.message,this.metadata});

  factory ExamsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseEntityFromJson(json);
}
