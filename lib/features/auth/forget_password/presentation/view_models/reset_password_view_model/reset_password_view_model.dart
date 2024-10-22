import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/cache/shared_preferences.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/results/result.dart';
import '../../../domain/entities/reset_password_entity/reset_password_entity.dart';
import '../../../domain/usecases/reset_password_usecase.dart';
import 'reset_password_states.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  ResetPasswordUsecase usecase;

  @factoryMethod
  ResetPasswordViewModel(this.usecase)
      : super(ResetPasswordStatesInitialState());

  bool isObscureNewPassword = true;
  bool isObscureConfirmPassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = SharedPreferencesHelper.getString(
      key: AppConstants.forgetPasswordUserEmail);

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void doIntent(ResetPasswordActions action) {
    switch (action) {
      case ResetPasswordAction():
        _resetPassword();
        break;
    }
  }

  Future<void> _resetPassword() async {
    if (formKey.currentState?.validate() == true) {
      emit(ResetPasswordStatesLoadingState('Loading..'));

      Result<ResetPasswordEntity?> result =
          await usecase.invoke(email, newPassword.text);

      switch (result) {
        case Success<ResetPasswordEntity?>():
          emit(ResetPasswordStatesSuccessState(result.data));
          break;
        case Fail<ResetPasswordEntity?>():
          emit(
            ResetPasswordStatesErrorState(result.exception?.message ??
                "Some thing went worng, please try again"),
          );
          break;
      }
    }
  }
}
