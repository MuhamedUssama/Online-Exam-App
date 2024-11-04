import '../../../../../../core/results/result.dart';
import '../entities/change_password_entity.dart';
import '../entities/logout_entity.dart';
import '../entities/user_profile_entity.dart';

abstract class UserProfileRepository {
  Future<Result<UserProfileEntity?>> getLoggedUserInfo();

  Future<Result<UserProfileEntity?>> editProfile({
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  });

  Future<Result<LogoutEntity?>> logout();

  Future<Result<ChangePasswordEntity?>> changePassword({
    String? oldPassword,
    String? newPassword,
    String? rePassword,
  });
}
