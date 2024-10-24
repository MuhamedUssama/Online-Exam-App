import '../../../domain/entities/auth_response_entity.dart';

sealed class LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String? errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginSuccessState extends LoginStates {
  AuthResponseEntity? user;
  LoginSuccessState(this.user);
}
