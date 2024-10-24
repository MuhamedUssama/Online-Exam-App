import '../../../../../../core/results/result.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../domain/entities/logout_entity.dart';
import '../../domain/entities/user_profile_entity.dart';

abstract class UserProfileDataSource {
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
