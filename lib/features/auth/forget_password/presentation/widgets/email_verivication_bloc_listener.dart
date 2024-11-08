import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_dialogs.dart';
import '../../../../../core/utils/app_strings.dart';
import '../reset_password_screen.dart';
import '../view_models/email_verification_view_model/email_verification_states.dart';
import '../view_models/email_verification_view_model/email_verification_view_model.dart';

class EmailVerivicationBlocListener extends StatelessWidget {
  final EmailVerificationViewModel viewModel;
  final Widget child;

  const EmailVerivicationBlocListener({
    super.key,
    required this.viewModel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerificationViewModel, EmailVerificationStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is EmailVerificationLoadingState) {
          AppDialogs.showLoading(
            message: AppStrings.loadingText,
            context: context,
          );
        } else if (state is EmailVerificationErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailDialog(
            message: state.errorMessage ?? AppStrings.somethingWentWrong,
            context: context,
            posActionTitle: AppStrings.ok,
          );
        } else if (state is EmailVerificationSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message: AppStrings.emailVerificationSuccessMessage,
            context: context,
            posActionTitle: AppStrings.ok,
            posAction: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordScreen(),
                ),
              );
            },
          );
        } else if (state is EmailVerificationResentCodeSuccesState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message: AppStrings.resendCodeSuccessState,
            context: context,
            posActionTitle: AppStrings.ok,
          );
        }
      },
      child: child,
    );
  }
}
