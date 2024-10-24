import 'package:json_annotation/json_annotation.dart';

part 'reset_password_entity.g.dart';

@JsonSerializable()
class ResetPasswordEntity {
  String? message;
  String? token;

  ResetPasswordEntity({this.message, this.token});

  factory ResetPasswordEntity.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordEntityFromJson(json);
}
