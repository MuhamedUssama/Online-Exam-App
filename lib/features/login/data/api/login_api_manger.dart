import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/networking/api_consumer.dart';
import 'package:online_exam_app/core/networking/end_points.dart';

import '../../../../core/networking/dio_consumer.dart';
import '../../../data_models/models/Auth_response.dart';

@singleton
@injectable
class LoginApiManger {
  ApiConsumer apiConsumer;
  @factoryMethod LoginApiManger(this.apiConsumer);
  Future<AuthResponse> login({required String email,required String password})async{
    var json = await apiConsumer.post(EndPoints.loginUrl,body:{
      'email':email,
      'password':password
    });
    var authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }
}