import 'package:json_annotation/json_annotation.dart';

part 'user_response_entity.g.dart';

@JsonSerializable()
class UserResponseEntity {
  @JsonKey(name: '_id')
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;

  UserResponseEntity({
    this.email,
    this.firstName,
    this.id,
    this.isVerified,
    this.lastName,
    this.phone,
    this.username,
  });

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UserResponseEntityFromJson(json);
}
