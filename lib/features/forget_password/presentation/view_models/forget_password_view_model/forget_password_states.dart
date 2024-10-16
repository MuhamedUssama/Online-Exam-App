import '../../../domain/entities/forget_password_entity/forget_passowrd_entity.dart';

sealed class ForgetPasswordActions {}

class ForgetPasswordAction extends ForgetPasswordActions {}

sealed class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {
  String message;
  ForgetPasswordLoadingState(this.message);
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  String? errorMessage;
  ForgetPasswordErrorState(this.errorMessage);
}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
  ForgetPasswordEntity? response;
  ForgetPasswordSuccessState(this.response);
}
