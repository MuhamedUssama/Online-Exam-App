import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/exceptions.dart';

import '../../../../../core/results/result.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../domain/models/user_dto.dart';
import '../api/auth_api_manger.dart';
import '../models/user.dart';
import 'auth_data_source.dart';

@Injectable(as: AuthDataSource)
class LoginDataSourceImpl implements AuthDataSource {
  ApiManger apiManger;
  @factoryMethod
  LoginDataSourceImpl(this.apiManger);
  @override
  Future<Result<User?>> login({
    required String email,
    required String password,
  }) async {
    var result = await apiManger.login(email: email, password: password);
    UserDto userDto = UserDto(token: result.token);
    if (result.message == 'success') {
      return Success(userDto.toUser());
    } else {
      return Fail(ServerException(
        result.message ?? AppStrings.somethingWentWrong,
      ));
    }
  }

  @override
  Future<Result<User?>> signUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    var result = await apiManger.signUp(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
    var userDto = UserDto(token: result.token);
    if (result.message == 'success') {
      return Success(userDto.toUser());
    } else {
      return Fail(ServerException(
        result.message ?? AppStrings.somethingWentWrong,
      ));
    }
  }
}
