import '../../../../../core/results/result.dart';
import '../../domain/entities/email_verification_entity/email_verification_entity.dart';
import '../../domain/entities/forget_password_entity/forget_passowrd_entity.dart';
import '../../domain/entities/reset_password_entity/reset_password_entity.dart';

abstract class ForgetPasswordDataSource {
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);

  Future<Result<EmailVerificationEntity?>> emailVerification(String resetCode);

  Future<Result<ResetPasswordEntity?>> resetPassword(
    String email,
    String newPassword,
  );
}
