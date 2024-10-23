import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_dialogs.dart';
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
          AppDialogs.showLoading(message: 'Loading..', context: context);
        } else if (state is EmailVerificationErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailDialog(
            message: state.errorMessage ?? "Somthing went wrong",
            context: context,
            posActionTitle: 'Ok',
          );
        } else if (state is EmailVerificationSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message: "Now you can change your password",
            context: context,
            posActionTitle: 'Ok',
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
            message: 'Check your email please, Code resent successfully.',
            context: context,
            posActionTitle: 'Ok',
          );
        }
      },
      child: child,
    );
  }
}
