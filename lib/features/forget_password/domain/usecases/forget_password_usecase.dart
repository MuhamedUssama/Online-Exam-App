import 'package:injectable/injectable.dart';

import '../../../../core/results/result.dart';
import '../entities/forget_password_entity/forget_passowrd_entity.dart';
import '../repository/forget_password_repository.dart';

@injectable
class ForgetPasswordUsecase {
  ForgetPasswordRepository repository;

  @factoryMethod
  ForgetPasswordUsecase(this.repository);

  Future<Result<ForgetPasswordEntity?>> invoke(String email) {
    return repository.forgetPassword(email);
  }
}
