import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/auth/ui/login/login_screen.dart';

import '../../../config/theme/test_style.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../../core/widgets/custom_blue_button.dart';
import '../../../core/widgets/custom_form_field.dart';
import 'view_models/reset_password_view_model/reset_password_states.dart';
import 'view_models/reset_password_view_model/reset_password_view_model.dart';
import 'widgets/screen_description_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var viewModel = getIt.get<ResetPasswordViewModel>();

  @override
  void dispose() {
    viewModel.newPassword.dispose();
    viewModel.confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Password', style: TextStyles.font20BaseDarkMedium),
      ),
      body: BlocListener<ResetPasswordViewModel, ResetPasswordStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is ResetPasswordStatesLoadingState) {
            DialogUtils.showLoading(context, state.message);
          } else if (state is ResetPasswordStatesErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context,
              title: "Error",
              contentMessage: state.errorMessage ?? "Something went wrong",
              posActionName: "Ok",
            );
          } else if (state is ResetPasswordStatesSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context,
                title: "Successfully",
                contentMessage: "You now have a new password",
                posActionName: "Ok", posActionFunction: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ScreenDescriptionWidget(
                  title: 'Reset password',
                  description:
                      'Password must not be empty and must contain \n6 characters with upper case letter and one \nnumber at least ',
                ),
                SizedBox(height: 32.h),
                CustomFormFiled(
                  hintText: 'Enter your password',
                  labelText: 'New password',
                  controller: viewModel.newPassword,
                  secureText: viewModel.isObscureNewPassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (viewModel.isObscureNewPassword) {
                          viewModel.isObscureNewPassword = false;
                        } else {
                          viewModel.isObscureNewPassword = true;
                        }
                      });
                    },
                    child: viewModel.isObscureNewPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.h),
                CustomFormFiled(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  controller: viewModel.confirmPassword,
                  secureText: viewModel.isObscureConfirmPassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (viewModel.isObscureConfirmPassword) {
                          viewModel.isObscureConfirmPassword = false;
                        } else {
                          viewModel.isObscureConfirmPassword = true;
                        }
                      });
                    },
                    child: viewModel.isObscureConfirmPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email address";
                    }

                    if (viewModel.confirmPassword.text !=
                        viewModel.newPassword.text) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 48.h),
                CustomBlueButton(
                  width: width,
                  text: 'Continue',
                  onPresed: () {
                    viewModel.doIntent(ResetPasswordAction());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
