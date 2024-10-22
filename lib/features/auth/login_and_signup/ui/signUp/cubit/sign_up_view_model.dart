import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/auth/login_and_signup/ui/signUp/cubit/sign_up_states.dart';

import '../../../data/models/User.dart';

import '../../../domain/usecases/sign_up_usecase.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpStates> {
  SignUpUsecase usecase;
  @factoryMethod
  SignUpViewModel(this.usecase) : super(SignUpLoadingState());
  TextEditingController username = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phone = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isObscurePassword = true;
  bool isObscureRePassword = true;
  void doAction({required SignUpScreenIntent intent}) async {
    switch (intent) {
      case SignUpIntent():
        _signUp();
        break;
    }
  }

  Future<void> _signUp() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(SignUpLoadingState());

      var result = await usecase.invoke(
          username: username.text,
          firstName: firstName.text,
          lastName: lastName.text,
          email: email.text,
          password: password.text,
          rePassword: rePassword.text,
          phone: phone.text);
      switch (result) {
        case Success<User?>():
          {
            emit(SignUpSuccessState(result.data));
          }
        case Fail<User?>():
          {
            emit(SignUpErrorState(result.exception?.message ?? ""));
          }
      }
    }
  }
}

sealed class SignUpScreenIntent {}

class SignUpIntent extends SignUpScreenIntent {
  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;

  SignUpIntent(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.rePassword,
      required this.phone});
}
