import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/exceptions.dart';
import 'package:online_exam_app/core/networking/api_consumer.dart';
import 'package:online_exam_app/features/forget_password/data/models/request/email_verification_request_model.dart/email_verification_request_model.dart';
import 'package:online_exam_app/features/forget_password/data/models/response/email_verification_response_model/email_verification_response_model.dart';

import '../../../../core/networking/end_points.dart';
import '../../../../core/results/result.dart';
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

  Future<Result<ForgetPasswordResponseModel?>> forgetPassword(
      String email) async {
    final ForgetPasswordRequestModel requestBody =
        ForgetPasswordRequestModel(email: email);

    final json = await apiConsumer.post(
      EndPoints.forgetPassword,
      body: requestBody.toJson(),
    );

    ForgetPasswordResponseModel forgetPasswordResponse =
        ForgetPasswordResponseModel.fromJson(json);

    if (forgetPasswordResponse.message == 'success') {
      return Success(forgetPasswordResponse);
    } else {
      return Fail(ServerException(forgetPasswordResponse.message));
    }
  }

  Future<Result<EmailVerificationResponseModel?>> verifyResetCode(
      String resetCode) async {
    final EmailVerificationRequestModel requestBody =
        EmailVerificationRequestModel(resetCode: resetCode);

    final json = await apiConsumer.post(
      EndPoints.verifyResetCode,
      body: requestBody.toJson(),
    );

    EmailVerificationResponseModel emailVerificationResponse =
        EmailVerificationResponseModel.fromJson(json);

    if (emailVerificationResponse.status == 'Success') {
      return Success(emailVerificationResponse);
    } else {
      return Fail(ServerException(emailVerificationResponse.message));
    }
  }

  Future<Result<ResetPasswordResponseModel?>> resetPassword(
      String? email, String? newPassword) async {
    final ResetPasswordRequestModel requestBody =
        ResetPasswordRequestModel(email: email, newPassword: newPassword);

    final json = await apiConsumer.put(
      EndPoints.resetPassword,
      body: requestBody.toJson(),
    );

    ResetPasswordResponseModel resetPasswordResponse =
        ResetPasswordResponseModel.fromJson(json);

    if (resetPasswordResponse.message == 'success') {
      return Success(resetPasswordResponse);
    } else {
      return Fail(ServerException(resetPasswordResponse.message));
    }
  }
}
