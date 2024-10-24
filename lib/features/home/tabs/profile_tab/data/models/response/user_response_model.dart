import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/user_entity.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'username')
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? passwordChangedAt;
  String? createdAt;
  String? role;

  UserResponseModel({
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.phone,
    this.userName,
    this.createdAt,
    this.passwordChangedAt,
    this.role,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  UserEntity toUserEntity() {
    return UserEntity(
      email: email,
      firstName: firstName,
      id: id,
      lastName: lastName,
      phone: phone,
      userName: userName,
    );
  }
}
