import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/auth/forget_password/data/data_source/forget_password_data_source.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entities/email_verification_entity/email_verification_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entities/forget_password_entity/forget_passowrd_entity.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entities/reset_password_entity/reset_password_entity.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../domain/repository/forget_password_repository.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  ForgetPasswordDataSource forgetPasswordDataSource;

  @factoryMethod
  ForgetPasswordRepositoryImpl(this.forgetPasswordDataSource);

  Future<bool> _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi));
  }

  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email) async {
    if (await _checkInternetConnection()) {
      return forgetPasswordDataSource.forgetPassword(email);
    } else {
      return Fail(const NoInternetConnectionException());
    }
  }

  @override
  Future<Result<EmailVerificationEntity?>> emailVerification(
      String resetCode) async {
    if (await _checkInternetConnection()) {
      return forgetPasswordDataSource.emailVerification(resetCode);
    } else {
      return Fail(const NoInternetConnectionException());
    }
  }

  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword) async {
    if (await _checkInternetConnection()) {
      return forgetPasswordDataSource.resetPassword(email, newPassword);
    } else {
      return Fail(const NoInternetConnectionException());
    }
  }
}
