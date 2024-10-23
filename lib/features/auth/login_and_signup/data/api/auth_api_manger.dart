import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/networking/api_consumer.dart';
import 'package:online_exam_app/core/networking/end_points.dart';

import '../models/auth_response.dart';

@singleton
@injectable
class ApiManger {
  ApiConsumer apiConsumer;
  @factoryMethod
  ApiManger(this.apiConsumer);
  Future<AuthResponse> login(
      {required String email, required String password}) async {
    var json = await apiConsumer
        .post(EndPoints.loginUrl, body: {'email': email, 'password': password});
    var authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }

  Future<AuthResponse> signUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    var json = await apiConsumer.post(EndPoints.signUpUrl, body: {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone
    });
    var authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }
}
