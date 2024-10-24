import '../../../../../../core/results/result.dart';
import '../entities/change_password_entity.dart';
import '../entities/logout_entity.dart';
import '../entities/user_profile_entity.dart';

abstract class UserProfileRepository {
  Future<Result<UserProfileEntity?>> getLoggedUserInfo();

  Future<Result<UserProfileEntity?>> editProfile({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  });

  Future<Result<LogoutEntity?>> logout();

  Future<Result<ChangePasswordEntity?>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  });
}
