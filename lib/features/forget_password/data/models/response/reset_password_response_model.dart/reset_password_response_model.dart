import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_model.g.dart';

@JsonSerializable()
class ResetPasswordResponseModel {
  String? message;
  String? token;

  ResetPasswordResponseModel({this.message, this.token});

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseModelFromJson(json);
}
