import 'package:injectable/injectable.dart';

import '../../../../../../core/networking/api_consumer.dart';
import '../../../../../../core/networking/end_points.dart';
import '../models/request/change_password_request_model.dart';
import '../models/request/edit_profile_request_model.dart';
import '../models/response/change_password_response_model.dart';
import '../models/response/logout_response_model.dart';
import '../models/response/profile_info_response_model.dart';

@singleton
@injectable
class UserProfileApiManager {
  final ApiConsumer _apiConsumer;

  @factoryMethod
  UserProfileApiManager(this._apiConsumer);

  Future<ProfileInfoResponseModel?> getLoggedUserInfo() async {
    final json = await _apiConsumer.get(EndPoints.getLoggedUserinfo);

    return ProfileInfoResponseModel.fromJson(json);
  }

  Future<ProfileInfoResponseModel?> editProfile({
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) async {
    final EditProfileRequestModel requestModel = EditProfileRequestModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      username: userName,
      phone: phone,
    );

    final json = await _apiConsumer.put(
      EndPoints.editProfile,
      body: requestModel.toJson(),
    );

    return ProfileInfoResponseModel.fromJson(json);
  }

  Future<LogoutResponseModel?> logout() async {
    final json = await _apiConsumer.get(EndPoints.logout);

    return LogoutResponseModel.fromJson(json);
  }

  Future<ChangePasswordResponseModel?> changePassword({
    String? oldPassword,
    String? password,
    String? rePassword,
  }) async {
    final ChangePasswordRequestModel requestModel = ChangePasswordRequestModel(
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );

    final json = await _apiConsumer.patch(
      EndPoints.changePassword,
      body: requestModel.toJson(),
    );

    return ChangePasswordResponseModel.fromJson(json);
  }
}
