import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/email_verification_entity/email_verification_entity.dart';

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

  EmailVerificationEntity toEmailVerificationEntity() {
    return EmailVerificationEntity(
      code: code,
      message: message,
      stack: stack,
      status: status,
    );
  }
}
