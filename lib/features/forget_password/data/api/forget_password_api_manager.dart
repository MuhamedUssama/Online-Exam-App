import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/networking/api_consumer.dart';
import 'package:online_exam_app/features/forget_password/data/models/request/email_verification_request_model.dart/email_verification_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/response/email_verification_response_model/email_verification_response_model.dart';

import '../../../../core/networking/end_points.dart';
import '../models/request/forget_password_request_model.dart/forget_password_request_model.dart';
import '../models/request/reset_password_request_model/reset_password_request_model.dart';
import '../models/response/forget_password_response_model.dart/forget_password_response_model.dart';
import '../models/response/reset_password_response_model.dart/reset_password_response_model.dart';

@injectable
@singleton
class ForgetPasswordApiManager {
  ApiConsumer apiConsumer;

  @factoryMethod
  ForgetPasswordApiManager(this.apiConsumer);

  Future<ForgetPasswordResponseModel?> forgetPassword(String email) async {
    final ForgetPasswordRequestModel requestBody =
        ForgetPasswordRequestModel(email: email);

    final json = await apiConsumer.post(
      EndPoints.forgetPassword,
      body: requestBody.toJson(),
    );

    return ForgetPasswordResponseModel.fromJson(json);
  }

  Future<EmailVerificationResponseModel?> verifyResetCode(
      String resetCode) async {
    final EmailVerificationRequestModel requestBody =
        EmailVerificationRequestModel(resetCode: resetCode);

    final json = await apiConsumer.post(
      EndPoints.verifyResetCode,
      body: requestBody.toJson(),
    );

    return EmailVerificationResponseModel.fromJson(json);
  }

  Future<ResetPasswordResponseModel?> resetPassword(
      String? email, String? newPassword) async {
    final ResetPasswordRequestModel requestBody =
        ResetPasswordRequestModel(email: email, newPassword: newPassword);

    final json = await apiConsumer.put(
      EndPoints.resetPassword,
      body: requestBody.toJson(),
    );

    return ResetPasswordResponseModel.fromJson(json);
  }
}
