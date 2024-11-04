import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'username')
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  UserEntity({
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.phone,
    this.userName,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
