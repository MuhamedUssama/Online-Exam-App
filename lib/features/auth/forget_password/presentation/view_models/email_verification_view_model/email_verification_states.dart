import '../../../domain/entities/email_verification_entity/email_verification_entity.dart';
import '../../../domain/entities/forget_password_entity/forget_passowrd_entity.dart';

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

class EmailVerificationResentCodeSuccesState extends EmailVerificationStates {
  ForgetPasswordEntity? response;
  EmailVerificationResentCodeSuccesState(this.response);
}
