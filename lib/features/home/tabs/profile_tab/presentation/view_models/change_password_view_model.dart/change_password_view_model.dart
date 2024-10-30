import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/cache/shared_preferences.dart';
import '../../../../../../../core/constants/app_constants.dart';
import '../../../../../../../core/results/result.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/change_password_entity.dart';
import '../../../domain/usecases/change_password_usecase.dart';
import 'change_password_actions.dart';
import 'change_password_states.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordStates> {
  final ChangePasswordUsecase _changePasswordUsecase;

  @factoryMethod
  ChangePasswordViewModel(this._changePasswordUsecase)
      : super(ChangePasswordInitialState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscureCurrentPassword = true;
  bool isObscureNewPassword = true;
  bool isObscureConfirmPassword = true;

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void doIntent(ChangePasswordActions actions) {
    switch (actions) {
      case UpdateUserPasswordAction():
        _cahngePassword();
        break;
    }
  }

  Future<void> _cahngePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState('Loading..'));

      Result<ChangePasswordEntity?> result = await _changePasswordUsecase(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        rePassword: confirmPasswordController.text,
      );

      switch (result) {
        case Success<ChangePasswordEntity?>():
          SharedPreferencesHelper.setSecuredString(
            key: AppConstants.token,
            value: result.data?.token ?? '',
          );
          emit(ChangePasswordSuccessState(result.data));
          break;

        case Fail<ChangePasswordEntity?>():
          emit(
            ChangePasswordFailureState(
              errorMessage:
                  result.exception?.message ?? AppStrings.somethingWentWrong,
            ),
          );
          break;
      }
    }
  }
}
