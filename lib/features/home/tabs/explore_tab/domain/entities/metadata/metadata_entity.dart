import 'package:json_annotation/json_annotation.dart';
part 'metadata_entity.g.dart';

@JsonSerializable()
class MetadataEntity {
  num? currentPage;
  num? numberOfPages;
  num? limit;

  MetadataEntity({this.currentPage,this.numberOfPages,this.limit});

  factory MetadataEntity.fromJson(Map<String, dynamic> json) =>
      _$MetadataEntityFromJson(json);


}
