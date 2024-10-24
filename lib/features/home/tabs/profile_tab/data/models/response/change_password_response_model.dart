import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/change_password_entity.dart';

part 'change_password_response_model.g.dart';

@JsonSerializable()
class ChangePasswordResponseModel {
  String? message;
  int? code;
  String? stack;
  String? token;

  ChangePasswordResponseModel({
    this.code,
    this.message,
    this.stack,
    this.token,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseModelFromJson(json);

  ChangePasswordEntity toChangePasswordEntity() {
    return ChangePasswordEntity(
      code: code,
      message: message,
      stack: stack,
      token: token,
    );
  }
}
