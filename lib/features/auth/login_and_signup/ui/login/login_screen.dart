import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';
import 'package:online_exam_app/core/utils/app_strings.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/features/auth/login_and_signup/ui/signUp/sign_up_screen.dart';

import '../../../../../config/router/routes_name.dart';
import '../../../../../config/theme/test_style.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/validation_utils.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';

import 'cubit/login_states.dart';
import 'cubit/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  void dispose() {
    viewModel.email.dispose();
    viewModel.password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.loginTitle,
          style: TextStyles.font20BaseDarkMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<LoginViewModel, LoginStates>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is LoginLoadingState) {
              DialogUtils.showLoading(context, 'Loading.');
            } else if (state is LoginErrorState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                  contentMessage: state.errorMessage ?? "Please Try Again",
                  title: 'Error',
                  posActionName: 'Ok');
            } else if (state is LoginSuccessState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                context,
                contentMessage: 'User Logged In Successfully',
                title: 'Success',
                posActionName: 'Ok',
              );
            }
          },
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                CustomFormFiled(
                  labelText: AppStrings.emailLabelText,
                  hintText: AppStrings.emailHintText,
                  controller: viewModel.email,
                  validator: (text) {
                    return AppValidator.validateEmailAddress(text);
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomFormFiled(
                  labelText: AppStrings.passwordLabelText,
                  hintText: AppStrings.passwordHintText,
                  controller: viewModel.password,
                  secureText: viewModel.isObscurePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (viewModel.isObscurePassword) {
                          viewModel.isObscurePassword = false;
                        } else {
                          viewModel.isObscurePassword = true;
                        }
                      });
                    },
                    child: viewModel.isObscurePassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  validator: (text) {
                    return AppValidator.validateFieldIsNotEmpty(
                      value: text,
                      message: AppStrings.emptyPassword,
                    );
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: ColorsManager.baseBlue,
                          value: viewModel.isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              viewModel.isChecked = value ?? false;
                            });
                          },
                        ),
                        const Text(AppStrings.rememberMeText),
                      ],
                    ),
                    TextButton(
                      style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.forgetPasswordScreen);
                      },
                      child: Text(
                        AppStrings.forgetPasswordText,
                        style: TextStyles.text12ButtonBaseBlackRegular,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48.h),
                CustomBlueButton(
                  width: width,
                  text: AppStrings.loginTitle,
                  onPresed: () {
                    viewModel.doAction(intent: LoginIntent());
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.donotHaveAccountText,
                      style: TextStyles.font16BlackRegular,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.signUpTitle,
                        style: TextStyles.textButtonBaseBlueRegular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
