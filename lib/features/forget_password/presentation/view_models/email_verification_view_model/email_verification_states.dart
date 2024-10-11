import '../../../domain/entities/email_verification_entity/email_verification_entity.dart';

sealed class Action {}

class EmailVerificationAction extends Action {
  String email;
  String password;
  EmailVerificationAction(this.email, this.password);
}

sealed class EmailVerificationStates {}

class EmailVerificationInitialState extends EmailVerificationStates {}

class EmailVerificationLoadingState extends EmailVerificationStates {
  String message;
  EmailVerificationLoadingState(this.message);
}

class EmailVerificationErrorState extends EmailVerificationStates {
  String? errorMessage;
  EmailVerificationErrorState(this.errorMessage);
}

class EmailVerificationSuccessState extends EmailVerificationStates {
  EmailVerificationEntity? response;
  EmailVerificationSuccessState(this.response);
}
