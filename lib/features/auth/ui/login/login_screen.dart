import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/features/auth/ui/signUp/sign_up_screen.dart';

import '../../../../config/router/routes_name.dart';
import '../../../../config/theme/test_style.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/custom_blue_button.dart';
import '../../../../core/widgets/custom_form_field.dart';

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

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyles.font20BaseDarkMedium),
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
              DialogUtils.showMessage(context,
                  contentMessage: 'User Logged In Successfully',
                  title: 'Success',
                  posActionName: 'Ok');
            }
          },
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomFormFiled(
                        labelText: 'Email',
                        hintText: 'Enter Your email',
                        controller: viewModel.email,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter email';
                          }
                          if (!isValidEmail(text)) {
                            return 'Please Enter Valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormFiled(
                        labelText: 'Enter Your Password',
                        hintText: 'Enter Password',
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
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Password';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
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
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                        const Text('Remember me'),
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
                          'Forget password?',
                          style: TextStyles.text12ButtonBaseBlackRegular,
                        ))
                  ],
                ),
                SizedBox(height: 48.h),
                CustomBlueButton(
                  width: width,
                  text: 'Login',
                  onPresed: () {
                    login();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
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
                      child: Text('Sign up',
                          style: TextStyles.textButtonBaseBlueRegular),
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

  void login() {
    viewModel.doAction(
        intent: LoginIntent(viewModel.email.text, viewModel.password.text));
  }
}
