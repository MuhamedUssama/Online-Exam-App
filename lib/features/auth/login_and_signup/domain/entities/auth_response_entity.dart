import 'package:json_annotation/json_annotation.dart';
import 'user_response_entity.dart';

part 'auth_response_entity.g.dart';

@JsonSerializable()
class AuthResponseEntity {
  String? message;
  String? token;
  UserResponseEntity? user;

  AuthResponseEntity({this.message, this.token, this.user});

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseEntityFromJson(json);
}
