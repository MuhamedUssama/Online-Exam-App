import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/exceptions.dart';
import 'package:online_exam_app/core/results/result.dart';

import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_data_source.dart';
import '../models/User.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource dataSource;
  @factoryMethod
  AuthRepositoryImpl(this.dataSource);
  Future<bool> _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi));
  }

  @override
  Future<Result<User?>> login(
      {required String email, required String password}) async {
    if (await _checkInternetConnection()) {
      return dataSource.login(email: email, password: password);
    }
    return Fail(const NoInternetConnectionException());
  }

  @override
  Future<Result<User?>> signUp(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    if (await _checkInternetConnection()) {
      return dataSource.signUp(
          username: username,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone);
    }
    return Fail(const NoInternetConnectionException());
  }
}
