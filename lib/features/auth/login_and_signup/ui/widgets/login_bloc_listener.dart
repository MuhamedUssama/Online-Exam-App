import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_dialogs.dart';
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
          AppDialogs.showLoading(message: 'Loading..', context: context);
        } else if (state is LoginErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailDialog(
            message: state.errorMessage ?? "Somthing went wrong",
            context: context,
            posActionTitle: 'Ok',
          );
        } else if (state is LoginSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message: 'User Logged In Successfully',
            context: context,
            posActionTitle: 'Ok',
          );
        }
      },
      child: child,
    );
  }
}
