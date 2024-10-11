import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/login/data/data_sources/login_data_source.dart';
import 'package:online_exam_app/features/login/domain/repository/login_repository.dart';

import '../../../data_models/models/User.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository{
  LoginDataSource dataSource;
  @factoryMethod LoginRepositoryImpl(this.dataSource);
  @override
  Future<Result<User?>> login({required String email, required String password}) {
    return dataSource.login(email: email, password: password);
  }

}