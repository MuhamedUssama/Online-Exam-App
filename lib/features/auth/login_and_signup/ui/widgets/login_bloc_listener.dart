import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_dialogs.dart';
import '../../../../../core/utils/app_strings.dart';
import '../login/cubit/login_states.dart';
import '../login/cubit/login_view_model.dart';

class LoginBlocListener extends StatelessWidget {
  final LoginViewModel viewModel;
  final Widget child;

  const LoginBlocListener({
    super.key,
    required this.viewModel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          AppDialogs.showLoading(
            message: AppStrings.loadingText,
            context: context,
          );
        } else if (state is LoginErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailDialog(
            message: state.errorMessage ?? AppStrings.somethingWentWrong,
            context: context,
            posActionTitle: AppStrings.ok,
          );
        } else if (state is LoginSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message: AppStrings.userLoggedInSuccessfully,
            context: context,
            posActionTitle: AppStrings.ok,
          );
        }
      },
      child: child,
    );
  }
}
