import 'package:json_annotation/json_annotation.dart';
part 'change_password_request_model.g.dart';

@JsonSerializable()
class ChangePasswordRequestModel {
  String? oldPassword;
  String? password;
  String? rePassword;

  ChangePasswordRequestModel({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordRequestModelToJson(this);
}
