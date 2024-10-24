import '../../../../../../core/results/result.dart';
import '../../domain/entities/change_password_entity.dart';
import '../../domain/entities/logout_entity.dart';
import '../../domain/entities/user_profile_entity.dart';

abstract class UserProfileDataSource {
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
