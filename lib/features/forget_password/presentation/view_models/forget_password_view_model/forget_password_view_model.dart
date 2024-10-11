import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/forget_password/domain/entities/forget_password_entity/forget_passowrd_entity.dart';

import '../../../domain/usecases/forget_password_usecase.dart';
import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordUsecase usecase;

  @factoryMethod
  ForgetPasswordViewModel(this.usecase) : super(ForgetPasswordInitialState());

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoadingState('Loading..'));

    if (formKey.currentState?.validate() == true) {
      final result = await usecase.invoke(emailController.text);

      switch (result) {
        case Success<ForgetPasswordEntity?>():
          {
            emit(ForgetPasswordSuccessState(result.data));
          }
        case Fail<ForgetPasswordEntity?>():
          {
            emit(ForgetPasswordErrorState(result.exception?.message ??
                'Some thing went worng, please try again'));
          }
      }
    }
  }
}
