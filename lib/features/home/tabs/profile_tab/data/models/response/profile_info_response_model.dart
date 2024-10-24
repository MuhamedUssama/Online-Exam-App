import 'package:json_annotation/json_annotation.dart';
import 'user_response_model.dart';

part 'profile_info_response_model.g.dart';

@JsonSerializable()
class ProfileInfoResponseModel {
  int? code;
  String? message;
  String? stack;
  UserResponseModel? user;

  ProfileInfoResponseModel({
    this.code,
    this.message,
    this.stack,
    this.user,
  });

  factory ProfileInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoResponseModelFromJson(json);
}
