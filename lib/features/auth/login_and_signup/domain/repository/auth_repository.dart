import '../../../../../core/results/result.dart';
import '../entities/auth_response_entity.dart';

abstract class AuthRepository {
  Future<Result<AuthResponseEntity?>> login({
    required String email,
    required String password,
  });
  Future<Result<AuthResponseEntity?>> signUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
}
