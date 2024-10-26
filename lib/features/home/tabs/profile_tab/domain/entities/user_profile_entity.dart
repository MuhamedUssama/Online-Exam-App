import 'package:json_annotation/json_annotation.dart';
import 'user_entity.dart';

part 'user_profile_entity.g.dart';

@JsonSerializable()
class UserProfileEntity {
  int? code;
  String? message;
  String? stack;
  UserEntity? user;

  UserProfileEntity({
    this.code,
    this.message,
    this.stack,
    this.user,
  });

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);
}
