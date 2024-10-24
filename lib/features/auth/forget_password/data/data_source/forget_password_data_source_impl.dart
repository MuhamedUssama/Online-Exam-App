import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/auth/forget_password/data/data_source/forget_password_data_source.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entities/email_verification_entity/email_verification_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entities/forget_password_entity/forget_passowrd_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entities/reset_password_entity/reset_password_entity.dart';

import '../../../../../core/errors/exceptions.dart';
import '../api/forget_password_api_manager.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  ForgetPasswordApiManager apiManager;

  @factoryMethod
  ForgetPasswordDataSourceImpl(this.apiManager);

  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email) async {
    var result = await apiManager.forgetPassword(email);
    if (result?.message == 'success') {
      return Success(result?.toForgetPasswordEntity());
    } else {
      return Fail(ServerException(
          result?.message ?? 'Something went worng, please try again.'));
    }
  }

  @override
  Future<Result<EmailVerificationEntity?>> emailVerification(
      String resetCode) async {
    try {
      var result = await apiManager.verifyResetCode(resetCode);
      if (result?.status == "Success") {
        return Success(result?.toEmailVerificationEntity());
      } else {
        return Fail(ServerException(
            result?.message ?? 'Verification code is incorrect or expired.'));
      }
    } catch (error) {
      return Fail(ServerException(error.toString()));
    }
  }

  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword) async {
    var result = await apiManager.resetPassword(email, newPassword);
    if (result?.message == "success") {
      return Success(result?.toResetPasswordEntity());
    } else {
      return Fail(ServerException(result?.message ?? 'Reset code not valid.'));
    }
  }
}
