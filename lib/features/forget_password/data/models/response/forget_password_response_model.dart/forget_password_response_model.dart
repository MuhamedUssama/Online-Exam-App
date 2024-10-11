import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
  String? message;
  String? info;

  ForgetPasswordResponseModel({this.message, this.info});

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);
}
