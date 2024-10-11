import 'package:json_annotation/json_annotation.dart';

part 'email_verification_response_model.g.dart';

@JsonSerializable()
class EmailVerificationResponseModel {
  String? status;

  EmailVerificationResponseModel({this.status});

  factory EmailVerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationResponseModelFromJson(json);
}
