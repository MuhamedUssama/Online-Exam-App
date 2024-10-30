import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/results/result.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/logout_entity.dart';
import '../../../domain/entities/user_profile_entity.dart';
import '../../../domain/usecases/edit_profile_usecase.dart';
import '../../../domain/usecases/get_logged_user_info_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';
import 'user_profile_screen_actions.dart';
import 'user_profile_states.dart';

@injectable
class UserProfileViewModel extends Cubit<UserProfileStates> {
  final GetLoggedUserInfoUsecase _getLoggedUserInfoUsecase;
  final EditProfileUsecase _editProfileUsecase;
  final LogoutUsecase _logoutUsecase;

  @factoryMethod
  UserProfileViewModel(
    this._getLoggedUserInfoUsecase,
    this._editProfileUsecase,
    this._logoutUsecase,
  ) : super(UserProfileInitialState());

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  TextEditingController phoneController = TextEditingController();

  void doIntent(UserProfileScreenActions action) {
    switch (action) {
      case GetLoggedUserDataAction():
        _getUserInfo();
        break;

      case UpdateUserProfileAction():
        _chnageUserInfo();
        break;

      case LogoutAction():
        _logout();
        break;
    }
  }

  Future<void> _getUserInfo() async {
    emit(UserProfileGetInfoLoadingState(AppStrings.loadingText));

    Result<UserProfileEntity?> result = await _getLoggedUserInfoUsecase();

    switch (result) {
      case Success<UserProfileEntity?>():
        {
          emailController.text = result.data?.user?.email ?? '';
          userNameController.text = result.data?.user?.userName ?? '';
          firstNameController.text = result.data?.user?.firstName ?? '';
          lastNameController.text = result.data?.user?.lastName ?? '';
          phoneController.text = result.data?.user?.phone ?? '';
          emit(GetLoggedUserDataSuccessState(result.data));
          break;
        }

      case Fail<UserProfileEntity?>():
        {
          emit(UserProfileGetInfoErrorState(
            result.exception?.message ?? AppStrings.somethingWentWrong,
          ));
          break;
        }
    }
  }

  Future<void> _chnageUserInfo() async {
    emit(UserProfileUpdateInfoLoadingState(AppStrings.loadingText));

    Result<UserProfileEntity?> result = await _editProfileUsecase(
      userName: userNameController.text,
      email: emailController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
    );

    switch (result) {
      case Success<UserProfileEntity?>():
        {
          emit(EditProfileSuccessState(result.data));
          break;
        }
      case Fail<UserProfileEntity?>():
        {
          emit(UserProfileUpdateInfoErrorState(
            result.exception?.message ?? AppStrings.somethingWentWrong,
          ));
          break;
        }
    }
  }

  Future<void> _logout() async {
    emit(UserProfileLogoutLoadingState(AppStrings.loadingText));

    Result<LogoutEntity?> result = await _logoutUsecase();

    switch (result) {
      case Success<LogoutEntity?>():
        {
          emit(LogoutSuccessState(result.data));
          break;
        }
      case Fail<LogoutEntity?>():
        {
          emit(UserProfileLogoutErrorState(
            result.exception?.message ?? AppStrings.somethingWentWrong,
          ));
          break;
        }
    }
  }
}
