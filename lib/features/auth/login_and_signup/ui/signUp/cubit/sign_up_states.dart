import '../../../domain/entities/auth_response_entity.dart';

sealed class SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  String? errorMessage;
  SignUpErrorState(this.errorMessage);
}

class SignUpSuccessState extends SignUpStates {
  AuthResponseEntity? user;
  SignUpSuccessState(this.user);
}
