import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';


import '../../../data/models/User.dart';

import '../../../domain/usecases/login_usecase.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates>{
  LoginUsecase usecase;
 @factoryMethod LoginViewModel(this.usecase):super(LoginLoadingState());
  void doAction({required LoginIntent intent})async{
    switch (intent) {
      case LoginIntent():_login(intent);
    }


  }
  void _login(LoginIntent intent) async{
    emit(LoginLoadingState());

    var result = await usecase.invoke(email:  intent.email,
       password:  intent.password);
    switch (result) {

      case Success<User?>():{

        emit(LoginSuccessState(result.data));
      }
      case Fail<User?>():{
        emit(LoginErrorState(result.exception?.message??""));
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
