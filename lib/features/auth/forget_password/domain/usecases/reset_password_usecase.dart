import 'package:injectable/injectable.dart';

import '../../../../../core/results/result.dart';
import '../entities/reset_password_entity/reset_password_entity.dart';
import '../repository/forget_password_repository.dart';

@injectable
class ResetPasswordUsecase {
  ForgetPasswordRepository repository;

  @factoryMethod
  ResetPasswordUsecase(this.repository);

  Future<Result<ResetPasswordEntity?>> invoke(
      String email, String newPassword) {
    return repository.resetPassword(email, newPassword);
  }
}
