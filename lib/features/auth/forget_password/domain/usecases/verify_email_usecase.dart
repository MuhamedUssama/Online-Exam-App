import 'package:injectable/injectable.dart';

import '../../../../../core/results/result.dart';
import '../entities/email_verification_entity/email_verification_entity.dart';
import '../repository/forget_password_repository.dart';

@injectable
class VerifyEmailUsecase {
  ForgetPasswordRepository repository;

  VerifyEmailUsecase(this.repository);

  Future<Result<EmailVerificationEntity?>> invoke(String resetCode) {
    return repository.emailVerification(resetCode);
  }
}
