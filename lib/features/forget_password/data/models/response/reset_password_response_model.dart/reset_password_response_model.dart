import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/reset_password_entity/reset_password_entity.dart';

part 'reset_password_response_model.g.dart';

@JsonSerializable()
class ResetPasswordResponseModel {
  String? message;
  String? token;

  ResetPasswordResponseModel({this.message, this.token});

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseModelFromJson(json);

  ResetPasswordEntity toResetPasswordEntity() {
    return ResetPasswordEntity(message: message, token: token);
  }
}
