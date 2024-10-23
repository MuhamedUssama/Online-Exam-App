import '../../../data/models/user.dart';

sealed class SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  String? errorMessage;
  SignUpErrorState(this.errorMessage);
}

class SignUpSuccessState extends SignUpStates {
  User? user;
  SignUpSuccessState(this.user);
}
