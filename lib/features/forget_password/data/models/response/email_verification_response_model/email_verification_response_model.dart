import 'package:json_annotation/json_annotation.dart';

part 'email_verification_response_model.g.dart';

@JsonSerializable()
class EmailVerificationResponseModel {
  String? status;
  String? message;
  String? code;
  String? stack;

  EmailVerificationResponseModel(
      {this.status, this.message, this.code, this.stack});

  factory EmailVerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationResponseModelFromJson(json);
}
