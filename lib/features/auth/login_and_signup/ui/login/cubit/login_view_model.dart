import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';

import '../../../domain/entities/auth_response_entity.dart';
import '../../../domain/usecases/login_usecase.dart';
import 'login_actions.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUsecase usecase;

  @factoryMethod
  LoginViewModel(this.usecase) : super(LoginLoadingState());

  var formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isChecked = false;

  bool isObscurePassword = true;
  void doAction({required LoginScreenIntent intent}) async {
    switch (intent) {
      case LoginIntent():
        _login();
        break;
    }
  }

  Future<void> _login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var result =
          await usecase.invoke(email: email.text, password: password.text);
      switch (result) {
        case Success<AuthResponseEntity?>():
          {
            emit(LoginSuccessState(result.data));
          }
        case Fail<AuthResponseEntity?>():
          {
            emit(LoginErrorState(result.exception?.message ?? ""));
          }
      }
    }
  }
}
