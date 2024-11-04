import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/metadata/metadata_entity.dart';
part 'metadata.g.dart';

@JsonSerializable()
class Metadata {
  num? currentPage;
  num? numberOfPages;
  num? limit;

  Metadata({this.currentPage,this.numberOfPages,this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

MetadataEntity toMetadataEntity(){
  return MetadataEntity(
    currentPage: currentPage,
    numberOfPages: numberOfPages,
    limit: limit
  );
}
}
