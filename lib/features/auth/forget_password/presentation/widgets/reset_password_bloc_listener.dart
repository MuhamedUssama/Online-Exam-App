import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_dialogs.dart';
import '../../../login_and_signup/ui/login/login_screen.dart';
import '../view_models/reset_password_view_model/reset_password_states.dart';
import '../view_models/reset_password_view_model/reset_password_view_model.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  final ResetPasswordViewModel viewModel;
  final Widget child;

  const ResetPasswordBlocListener({
    super.key,
    required this.viewModel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordViewModel, ResetPasswordStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ResetPasswordStatesLoadingState) {
          AppDialogs.showLoading(message: 'Loading..', context: context);
        } else if (state is ResetPasswordStatesErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailDialog(
            message: state.errorMessage ?? "Somthing went wrong",
            context: context,
            posActionTitle: 'Ok',
          );
        } else if (state is ResetPasswordStatesSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message: "You now have a new password",
            context: context,
            posActionTitle: 'Ok',
            posAction: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
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
