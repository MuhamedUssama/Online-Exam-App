import 'package:json_annotation/json_annotation.dart';

part 'change_password_entity.g.dart';

@JsonSerializable()
class ChangePasswordEntity {
  String? message;
  int? code;
  String? stack;
  String? token;

  ChangePasswordEntity({this.code, this.message, this.stack, this.token});

  factory ChangePasswordEntity.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordEntityFromJson(json);
}
