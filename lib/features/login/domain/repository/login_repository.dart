import '../../../../core/results/result.dart';
import '../../../data_models/models/User.dart';

abstract class LoginRepository {
  Future<Result<User?>> login({required String email,required String password});
}