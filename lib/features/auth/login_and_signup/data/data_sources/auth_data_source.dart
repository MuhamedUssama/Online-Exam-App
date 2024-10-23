import '../../../../../core/results/result.dart';
import '../models/user.dart';

abstract class AuthDataSource {
  Future<Result<User?>> login({
    required String email,
    required String password,
  });
  Future<Result<User?>> signUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
}
