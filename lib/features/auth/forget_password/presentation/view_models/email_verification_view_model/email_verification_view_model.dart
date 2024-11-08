import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/app_constants.dart';

import '../../../../../../core/cache/shared_preferences.dart';
import '../../../../../../core/results/result.dart';
import '../../../domain/entities/email_verification_entity/email_verification_entity.dart';
import '../../../domain/entities/forget_password_entity/forget_passowrd_entity.dart';
import '../../../domain/usecases/forget_password_usecase.dart';
import '../../../domain/usecases/verify_email_usecase.dart';
import 'email_verification_actions.dart';
import 'email_verification_states.dart';

@injectable
class EmailVerificationViewModel extends Cubit<EmailVerificationStates> {
  VerifyEmailUsecase verifyEmailUsecase;
  ForgetPasswordUsecase forgetPasswordUsecase;

  @factoryMethod
  EmailVerificationViewModel(
    this.verifyEmailUsecase,
    this.forgetPasswordUsecase,
  ) : super(EmailVerificationInitialState());

  var formKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();

  void doIntent(VerificationAction action) {
    switch (action) {
      case VerifyEmailAction():
        _verifyEmail();
        break;

      case ResendCodeAction():
        _resendCode();
        break;
    }
  }

  Future<void> _verifyEmail() async {
    if (formKey.currentState?.validate() == true) {
      emit(EmailVerificationLoadingState('Loading..'));

      Result<EmailVerificationEntity?> result =
          await verifyEmailUsecase.invoke(codeController.text);

      switch (result) {
        case Success<EmailVerificationEntity?>():
          {
            emit(EmailVerificationSuccessState(result.data));
            break;
          }
        case Fail<EmailVerificationEntity?>():
          {
            emit(EmailVerificationErrorState(result.exception?.message ??
                'Some thing went worng, please try again'));
            break;
          }
      }
    }
  }

  Future<void> _resendCode() async {
    emit(EmailVerificationLoadingState('Loading..'));

    String email = SharedPreferencesHelper.getString(
        key: AppConstants.forgetPasswordUserEmail);

    Result<ForgetPasswordEntity?> result =
        await forgetPasswordUsecase.invoke(email);

    switch (result) {
      case Success<ForgetPasswordEntity?>():
        {
          emit(EmailVerificationResentCodeSuccesState(result.data));
          break;
        }
      case Fail<ForgetPasswordEntity?>():
        {
          emit(EmailVerificationErrorState(result.exception?.message ??
              'Some thing went worng, please try again'));
          break;
        }
    }
  }
}
