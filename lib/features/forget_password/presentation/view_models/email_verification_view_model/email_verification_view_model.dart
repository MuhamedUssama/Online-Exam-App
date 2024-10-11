import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/results/result.dart';
import '../../../domain/entities/email_verification_entity/email_verification_entity.dart';
import '../../../domain/usecases/verify_email_usecase.dart';
import 'email_verification_states.dart';

@injectable
class EmailVerificationViewModel extends Cubit<EmailVerificationStates> {
  VerifyEmailUsecase usecase;

  @factoryMethod
  EmailVerificationViewModel(this.usecase)
      : super(EmailVerificationInitialState());

  var formKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();

  // Already i have one method in this view model so i don't need this approch but just for practice
  void doIntent(VerificationAction action) {
    switch (action) {
      case EmailVerificationAction():
        _verifyEmail();
    }
  }

  Future<void> _verifyEmail() async {
    if (formKey.currentState?.validate() == true) {
      emit(EmailVerificationLoadingState('Loading..'));

      Result<EmailVerificationEntity?> result =
          await usecase.invoke(codeController.text);

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
}
