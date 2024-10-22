import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/auth/forget_password/domain/entities/forget_password_entity/forget_passowrd_entity.dart';

import '../../../../../../core/cache/shared_preferences.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../domain/usecases/forget_password_usecase.dart';
import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordUsecase usecase;

  @factoryMethod
  ForgetPasswordViewModel(this.usecase) : super(ForgetPasswordInitialState());

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  // I know i have just one method (one action) so this method not necessary but just for practice
  void doIntent(ForgetPasswordActions action) {
    switch (action) {
      case ForgetPasswordAction():
        _forgetPassword();
        break;
    }
  }

  Future<void> _forgetPassword() async {
    if (formKey.currentState?.validate() == true) {
      emit(ForgetPasswordLoadingState('Loading..'));

      final result = await usecase.invoke(emailController.text);

      SharedPreferencesHelper.saveData(
        key: AppConstants.forgetPasswordUserEmail,
        value: emailController.text,
      );

      switch (result) {
        case Success<ForgetPasswordEntity?>():
          {
            emit(ForgetPasswordSuccessState(result.data));
            break;
          }
        case Fail<ForgetPasswordEntity?>():
          {
            emit(ForgetPasswordErrorState(result.exception?.message ??
                'Some thing went worng, please try again'));
            break;
          }
      }
    }
  }
}
