import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/login_and_signup/domain/repository/auth_repository.dart';

import '../../../../../core/results/result.dart';
import '../../data/models/User.dart';

@injectable
class SignUpUsecase {
  AuthRepository authRepository;
  @factoryMethod
  SignUpUsecase(this.authRepository);
  Future<Result<User?>> invoke(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    var response = await authRepository.signUp(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    return response;
  }
}
