import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/auth_response_entity.dart';
import 'user_response_model.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  String? message;
  String? token;
  UserResponseModel? user;

  AuthResponseModel({this.message, this.token, this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  AuthResponseEntity toAuthResponseEntity() {
    return AuthResponseEntity(
      message: message,
      token: token,
      user: user?.toUserResponseEntity(),
    );
  }
}
