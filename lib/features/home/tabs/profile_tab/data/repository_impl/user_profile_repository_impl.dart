import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/exceptions.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/home/tabs/profile_tab/domain/entities/change_password_entity.dart';
import 'package:online_exam_app/features/home/tabs/profile_tab/domain/entities/logout_entity.dart';
import 'package:online_exam_app/features/home/tabs/profile_tab/domain/entities/user_profile_entity.dart';

import '../../domain/repository/user_profile_repository.dart';
import '../data_sourse/user_profile_data_source.dart';

@Injectable(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileDataSource dataSource;

  @factoryMethod
  UserProfileRepositoryImpl(this.dataSource);

  Future<bool> _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi));
  }

  @override
  Future<Result<ChangePasswordEntity?>> changePassword({
    String? oldPassword,
    String? newPassword,
    String? rePassword,
  }) async {
    if (await _checkInternetConnection()) {
      return dataSource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        rePassword: rePassword,
      );
    } else {
      return Fail(const NoInternetConnectionException());
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
    if (await _checkInternetConnection()) {
      return dataSource.editProfile(
        userName: userName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );
    } else {
      return Fail(const NoInternetConnectionException());
    }
  }

  @override
  Future<Result<UserProfileEntity?>> getLoggedUserInfo() async {
    if (await _checkInternetConnection()) {
      return dataSource.getLoggedUserInfo();
    } else {
      return Fail(const NoInternetConnectionException());
    }
  }

  @override
  Future<Result<LogoutEntity?>> logout() async {
    if (await _checkInternetConnection()) {
      return dataSource.logout();
    } else {
      return Fail(const NoInternetConnectionException());
    }
  }
}
