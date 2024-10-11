import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/login/domain/repository/login_repository.dart';

import '../../../data_models/models/User.dart';
@injectable
class LoginUsecase{
  LoginRepository repository;
  @factoryMethod LoginUsecase(this.repository);
  Future<Result<User?>>invoke({required String email,required String password})async{
    var response = await repository.login(email: email, password: password);
    return response;
  }
}