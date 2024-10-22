import '../../../domain/entities/reset_password_entity/reset_password_entity.dart';

sealed class ResetPasswordActions {}

class ResetPasswordAction extends ResetPasswordActions {}

sealed class ResetPasswordStates {}

class ResetPasswordStatesInitialState extends ResetPasswordStates {}

class ResetPasswordStatesLoadingState extends ResetPasswordStates {
  String message;
  ResetPasswordStatesLoadingState(this.message);
}

class ResetPasswordStatesErrorState extends ResetPasswordStates {
  String? errorMessage;
  ResetPasswordStatesErrorState(this.errorMessage);
}

class ResetPasswordStatesSuccessState extends ResetPasswordStates {
  ResetPasswordEntity? response;
  ResetPasswordStatesSuccessState(this.response);
}
