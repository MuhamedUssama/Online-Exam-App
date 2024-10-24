import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/exceptions.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/home/tabs/profile_tab/domain/entities/change_password_entity.dart';
import 'package:online_exam_app/features/home/tabs/profile_tab/domain/entities/logout_entity.dart';
import 'package:online_exam_app/features/home/tabs/profile_tab/domain/entities/user_profile_entity.dart';

import '../api/user_profile_api_manager.dart';
import 'user_profile_data_source.dart';

@Injectable(as: UserProfileDataSource)
class UserProfileDataSourseImpl implements UserProfileDataSource {
  UserProfileApiManager apiManager;

  @factoryMethod
  UserProfileDataSourseImpl(this.apiManager);

  @override
  Future<Result<ChangePasswordEntity?>> changePassword(
      {String? oldPassword, String? newPassword, String? rePassword}) async {
    final result = await apiManager.changePassword(
      oldPassword: oldPassword,
      password: newPassword,
      rePassword: rePassword,
    );

    if (result?.message == 'success') {
      return Success(result?.toChangePasswordEntity());
    } else {
      return Fail(ServerException(result?.message ?? 'Something went wrong'));
    }
  }

  @override
  Future<Result<UserProfileEntity?>> editProfile({
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) async {
    final result = await apiManager.editProfile(
      email: email,
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      phone: phone,
    );

    if (result?.message == 'success') {
      return Success(result?.toUserProfileEntity());
    } else {
      return Fail(ServerException(result?.message ?? 'Something went wrong'));
    }
  }

  @override
  Future<Result<UserProfileEntity?>> getLoggedUserInfo() async {
    final result = await apiManager.getLoggedUserInfo();

    if (result?.message == 'success') {
      return Success(result?.toUserProfileEntity());
    } else {
      return Fail(ServerException(result?.message ?? 'Something went wrong'));
    }
  }

  @override
  Future<Result<LogoutEntity?>> logout() async {
    final result = await apiManager.logout();

    if (result?.message == 'success') {
      return Success(result?.toLogoutEntity());
    } else {
      return Fail(ServerException(result?.message ?? 'Something went wrong'));
    }
  }
}
