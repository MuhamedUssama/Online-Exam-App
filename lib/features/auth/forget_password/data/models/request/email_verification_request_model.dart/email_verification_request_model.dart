import 'package:json_annotation/json_annotation.dart';

part 'email_verification_request_model.g.dart';

@JsonSerializable()
class EmailVerificationRequestModel {
  String? resetCode;

  EmailVerificationRequestModel({this.resetCode});

  factory EmailVerificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmailVerificationRequestModelToJson(this);
}
