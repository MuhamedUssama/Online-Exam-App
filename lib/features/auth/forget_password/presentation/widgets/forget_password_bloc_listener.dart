import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_dialogs.dart';
import '../email_verification_screen.dart';
import '../view_models/forget_password_view_model/forget_password_states.dart';
import '../view_models/forget_password_view_model/forget_password_view_model.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  final ForgetPasswordViewModel viewModel;
  final Widget child;

  const ForgetPasswordBlocListener({
    super.key,
    required this.viewModel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          AppDialogs.showLoading(message: 'Loading..', context: context);
        } else if (state is ForgetPasswordErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailDialog(
            message: state.errorMessage ?? "Somthing went wrong",
            context: context,
            posActionTitle: 'Ok',
          );
        } else if (state is ForgetPasswordSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message:
                "Check your email please, we will send to you a verification code in 60s.",
            context: context,
            posActionTitle: 'Ok',
            posAction: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmailVerificationScreen(),
                ),
              );
            },
          );
        }
      },
      child: child,
    );
  }
}
