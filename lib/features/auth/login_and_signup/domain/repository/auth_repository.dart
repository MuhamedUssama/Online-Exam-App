import '../../../../../core/results/result.dart';
import '../../data/models/user.dart';

abstract class AuthRepository {
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
