import 'package:online_exam_app/core/results/result.dart';

import '../../../data_models/models/User.dart';


abstract class LoginDataSource {
  Future<Result<User?>> login({required String email,required String password});

}