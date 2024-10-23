import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';

import '../entities/auth_response_entity.dart';
import '../repository/auth_repository.dart';

@injectable
class LoginUsecase {
  AuthRepository authRepository;
  @factoryMethod
  LoginUsecase(this.authRepository);
  Future<Result<AuthResponseEntity?>> invoke(
      {required String email, required String password}) async {
    var response = await authRepository.login(email: email, password: password);
    return response;
  }
}
