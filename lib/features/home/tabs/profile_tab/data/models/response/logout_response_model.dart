import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/logout_entity.dart';

part 'logout_response_model.g.dart';

@JsonSerializable()
class LogoutResponseModel {
  String? message;
  int? code;
  String? stack;

  LogoutResponseModel({this.code, this.message, this.stack});

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);

  LogoutEntity toLogoutEntity() {
    return LogoutEntity(
      code: code,
      message: message,
      stack: stack,
    );
  }
}
