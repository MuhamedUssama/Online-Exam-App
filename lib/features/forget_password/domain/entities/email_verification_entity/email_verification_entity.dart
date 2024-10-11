import 'package:json_annotation/json_annotation.dart';

part 'email_verification_entity.g.dart';

@JsonSerializable()
class EmailVerificationEntity {
  String? status;
  String? message;
  String? code;
  String? stack;

  EmailVerificationEntity({this.status, this.message, this.code, this.stack});

  factory EmailVerificationEntity.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationEntityFromJson(json);
}
