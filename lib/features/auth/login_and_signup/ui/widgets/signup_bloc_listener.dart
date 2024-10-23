import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_dialogs.dart';
import '../../../../../core/utils/app_strings.dart';
import '../login/login_screen.dart';
import '../signUp/cubit/sign_up_states.dart';
import '../signUp/cubit/sign_up_view_model.dart';

class SignupBlocListener extends StatelessWidget {
  final SignUpViewModel viewModel;
  final Widget child;

  const SignupBlocListener({
    super.key,
    required this.viewModel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpViewModel, SignUpStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          AppDialogs.showLoading(
            message: AppStrings.loadingText,
            context: context,
          );
        } else if (state is SignUpErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailDialog(
            message: state.errorMessage ?? AppStrings.somethingWentWrong,
            context: context,
            posActionTitle: AppStrings.ok,
          );
        } else if (state is SignUpSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message: AppStrings.userCreatedSuccessfully,
            context: context,
            posActionTitle: AppStrings.ok,
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
