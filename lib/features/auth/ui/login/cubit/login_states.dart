

import '../../../data/models/User.dart';

sealed class LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  String? errorMessage;
  LoginErrorState(this.errorMessage);
}
class LoginSuccessState extends LoginStates{
  User? user;
  LoginSuccessState(this.user);
}