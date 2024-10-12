import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/auth/ui/signUp/cubit/sign_up_states.dart';


import '../../../data/models/User.dart';

import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpStates>{
  SignUpUsecase usecase;
  @factoryMethod SignUpViewModel(this.usecase):super(SignUpLoadingState());
  void doAction({required SignUpIntent intent})async{
    switch (intent) {
      case SignUpIntent():_login(intent);
    }


  }
  void _login(SignUpIntent intent) async{
    emit(SignUpLoadingState());

    var result = await usecase.invoke(
        username: intent.username,
        firstName: intent.firstName,
        lastName: intent.lastName,
        email: intent.email,
        password: intent.password,
        rePassword: intent.rePassword,
        phone: intent.phone);
    switch (result) {

      case Success<User?>():{

        emit(SignUpSuccessState(result.data));
      }
      case Fail<User?>():{
        emit(SignUpErrorState(result.exception?.message??""));
      }

    }

  }
}


sealed class SignUpScreenIntent{}
class SignUpIntent extends SignUpScreenIntent {
  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;

  SignUpIntent({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone});
}
