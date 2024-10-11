import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/forget_password_entity/forget_passowrd_entity.dart';

part 'forget_password_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
  String? message;
  String? info;

  ForgetPasswordResponseModel({this.message, this.info});

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);

  ForgetPasswordEntity toForgetPasswordEntity() {
    return ForgetPasswordEntity(message: message, info: info);
  }
}
