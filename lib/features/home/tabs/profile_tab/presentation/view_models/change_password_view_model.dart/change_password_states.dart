import '../../../domain/entities/change_password_entity.dart';

sealed class ChangePasswordStates {}

class ChangePasswordInitialState extends ChangePasswordStates {}

class ChangePasswordLoadingState extends ChangePasswordStates {
  String message;
  ChangePasswordLoadingState(this.message);
}

class ChangePasswordFailureState extends ChangePasswordStates {
  String? errorMessage;
  ChangePasswordFailureState({this.errorMessage});
}

class ChangePasswordSuccessState extends ChangePasswordStates {
  ChangePasswordEntity? changePasswordEntity;
  ChangePasswordSuccessState(this.changePasswordEntity);
}
