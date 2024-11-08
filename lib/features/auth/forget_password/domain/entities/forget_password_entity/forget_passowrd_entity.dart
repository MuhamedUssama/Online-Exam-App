import 'package:json_annotation/json_annotation.dart';

part 'forget_passowrd_entity.g.dart';

@JsonSerializable()
class ForgetPasswordEntity {
  String? message;
  String? info;

  ForgetPasswordEntity({this.message, this.info});

  factory ForgetPasswordEntity.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordEntityFromJson(json);
}
