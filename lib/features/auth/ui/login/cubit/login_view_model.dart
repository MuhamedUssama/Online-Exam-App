import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';


import '../../../data/models/User.dart';

import '../../../domain/usecases/login_usecase.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates>{
  LoginUsecase usecase;
 @factoryMethod
 LoginViewModel(this.usecase):super(LoginLoadingState());
  var formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool isObscurePassword = true;
  void doAction({required LoginScreenIntent intent})async{
    switch (intent) {
      case LoginIntent():_login();
      break;
    }


  }
  Future<void> _login() async{

    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var result = await usecase.invoke(email:email.text,
          password: password.text);
      switch (result) {
        case Success<User?>():
          {
            emit(LoginSuccessState(result.data));
          }
        case Fail<User?>():
          {
            emit(LoginErrorState(result.exception?.message ?? ""));
          }
      }
    }

    }
  }


sealed class LoginScreenIntent{}
class LoginIntent extends LoginScreenIntent{
  String email;
  String password;
  LoginIntent(this.email,this.password);
}
