import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/exceptions.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/login/data/api/login_api_manger.dart';
import 'package:online_exam_app/features/login/data/data_sources/login_data_source.dart';
import 'package:online_exam_app/features/domain-models/models/User_Dto.dart';

import '../../../../core/networking/executeApi.dart';
import '../../../data_models/models/User.dart';
@Injectable(as: LoginDataSource )
class LoginDataSourceImpl implements LoginDataSource{
  LoginApiManger apiManger;
  @factoryMethod LoginDataSourceImpl(this.apiManger);
  @override
  Future<Result<User?>> login({required String email, required String password}) {
   return executeApi(()async{
      var response = await apiManger.login(email: email, password: password);
      var userDto = UserDto(token: response.token);
      return userDto.toUser();
});
  }

}
