import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_response_entity.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  @JsonKey(name: '_id')
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;

  UserResponseModel({
    this.email,
    this.firstName,
    this.id,
    this.isVerified,
    this.lastName,
    this.phone,
    this.username,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  UserResponseEntity toUserResponseEntity() {
    return UserResponseEntity(
      email: email,
      firstName: firstName,
      id: id,
      isVerified: isVerified,
      lastName: lastName,
      phone: phone,
      username: username,
    );
  }
}
