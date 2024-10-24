import 'package:json_annotation/json_annotation.dart';
part 'edit_profile_request_model.g.dart';

@JsonSerializable()
class EditProfileRequestModel {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  EditProfileRequestModel({
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.username,
  });

  Map<String, dynamic> toJson() => _$EditProfileRequestModelToJson(this);
}
