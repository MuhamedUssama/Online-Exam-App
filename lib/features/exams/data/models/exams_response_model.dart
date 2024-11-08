import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/data/models/metadata/metadata.dart';

import '../../domain/entities/exams_response_entity.dart';
import 'exams_model.dart';
part 'exams_response_model.g.dart';

@JsonSerializable()
class ExamsResponseModel {
  List<ExamsModel>? exams;
  Metadata? metadata;
  String? message;

  ExamsResponseModel({this.exams, this.message,this.metadata});

  factory ExamsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseModelFromJson(json);

  ExamsResponseEntity toExamsResponseEntity (){
    return ExamsResponseEntity(
        exams: exams?.map((exam) => exam.toExamsEntity(),).toList(),
        message: message,
        metadata: metadata?.toMetadataEntity()

    );
  }
}
