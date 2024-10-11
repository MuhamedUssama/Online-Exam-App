import 'package:json_annotation/json_annotation.dart';

part 'email_verification_entity.g.dart';

@JsonSerializable()
class EmailVerificationEntity {
  String? status;

  EmailVerificationEntity({this.status});

  factory EmailVerificationEntity.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationEntityFromJson(json);
}
