import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/forget_password/data/data_source/forget_password_data_source.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/email_verification_entity/email_verification_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_password_entity/forget_passowrd_entity.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/reset_password_entity/reset_password_entity.dart';

import '../../../../core/results/execute_api.dart';
import '../api/forget_password_api_manager.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  ForgetPasswordApiManager apiManager;

  @factoryMethod
  ForgetPasswordDataSourceImpl(this.apiManager);

  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email) {
    return executeApi<ForgetPasswordEntity?>(
      () async {
        var result = await apiManager.forgetPassword(email);
        return Success(result?.toForgetPasswordEntity());
      },
    );
  }

  @override
  Future<Result<EmailVerificationEntity?>> emailVerification(String resetCode) {
    return executeApi<EmailVerificationEntity?>(
      () async {
        var result = await apiManager.verifyResetCode(resetCode);
        return Success(result?.toEmailVerificationEntity());
      },
    );
  }

  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword) {
    return executeApi<ResetPasswordEntity?>(
      () async {
        var result = await apiManager.resetPassword(email, newPassword);
        return Success(result?.toResetPasswordEntity());
      },
    );
  }
}
