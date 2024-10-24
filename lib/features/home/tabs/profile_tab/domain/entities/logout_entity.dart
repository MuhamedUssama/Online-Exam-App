import 'package:json_annotation/json_annotation.dart';
part 'logout_entity.g.dart';

@JsonSerializable()
class LogoutEntity {
  String? message;
  int? code;
  String? stack;

  LogoutEntity({this.code, this.message, this.stack});

  factory LogoutEntity.fromJson(Map<String, dynamic> json) =>
      _$LogoutEntityFromJson(json);
}
