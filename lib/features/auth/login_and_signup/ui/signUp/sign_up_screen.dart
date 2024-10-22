import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/router/routes_name.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/auth/login_and_signup/ui/login/login_screen.dart';

import '../../../../../config/theme/test_style.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/dialog_utils.dart';
import '../../../../../core/utils/validation_utils.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import 'cubit/sign_up_states.dart';
import 'cubit/sign_up_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel viewModel = getIt.get<SignUpViewModel>();
  @override
  void dispose() {
    viewModel.username.dispose();
    viewModel.firstName.dispose();
    viewModel.lastName.dispose();
    viewModel.password.dispose();
    viewModel.rePassword.dispose();
    viewModel.phone.dispose();
    viewModel.email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.signUpTitle,
          style: TextStyles.font20BaseDarkMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<SignUpViewModel, SignUpStates>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is SignUpLoadingState) {
              DialogUtils.showLoading(context, 'LOADING');
            } else if (state is SignUpErrorState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                  contentMessage: state.errorMessage ?? "Please Try Again",
                  title: 'Error',
                  posActionName: 'Ok');
            } else if (state is SignUpSuccessState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                  contentMessage: 'Created User Successfully',
                  title: 'Success',
                  posActionName: 'Ok', posActionFunction: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              });
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  CustomFormFiled(
                    labelText: AppStrings.userNameLabelText,
                    hintText: AppStrings.userNameHintText,
                    controller: viewModel.username,
                    validator: (text) {
                      return AppValidator.validateFieldIsNotEmpty(
                        value: text,
                        message: AppStrings.emptyUserName,
                      );
                    },
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormFiled(
                          labelText: AppStrings.firstNameLabelText,
                          hintText: AppStrings.firstNameHintText,
                          controller: viewModel.firstName,
                          validator: (text) {
                            return AppValidator.validateFieldIsNotEmpty(
                              value: text,
                              message: AppStrings.emptyFirstName,
                            );
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomFormFiled(
                          labelText: AppStrings.lastNameLabelText,
                          hintText: AppStrings.lastNameHintText,
                          controller: viewModel.lastName,
                          validator: (text) {
                            return AppValidator.validateFieldIsNotEmpty(
                              value: text,
                              message: AppStrings.emptyLastName,
                            );
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomFormFiled(
                    labelText: AppStrings.emailLabelText,
                    hintText: AppStrings.emailHintText,
                    controller: viewModel.email,
                    validator: (text) {
                      return AppValidator.validateEmailAddress(text);
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormFiled(
                          labelText: AppStrings.passwordLabelText,
                          hintText: AppStrings.enterPassword,
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
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomFormFiled(
                          labelText: AppStrings.confirmPasswordLabelText,
                          hintText: AppStrings.confirmPasswordLabelText,
                          controller: viewModel.rePassword,
                          secureText: viewModel.isObscureRePassword,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (viewModel.isObscureRePassword) {
                                  viewModel.isObscureRePassword = false;
                                } else {
                                  viewModel.isObscureRePassword = true;
                                }
                              });
                            },
                            child: viewModel.isObscureRePassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          validator: (text) {
                            return AppValidator.validateConfirmPassword(
                              confirmPassword: text,
                              password: viewModel.password.text,
                            );
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomFormFiled(
                    labelText: AppStrings.phoneLabelText,
                    hintText: AppStrings.phoneHintText,
                    controller: viewModel.phone,
                    validator: (text) {
                      return AppValidator.validateFieldIsNotEmpty(
                        value: text,
                        message: AppStrings.emptyPhone,
                      );
                    },
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 48.h),
                  CustomBlueButton(
                    width: width,
                    text: AppStrings.signUpTitle,
                    onPresed: () {
                      viewModel.doAction(intent: SignUpIntent());
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.alreadyHaveAccount,
                        style: TextStyles.font16BlackRegular,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesName.loginScreen,
                          );
                        },
                        child: Text(
                          AppStrings.loginTitle,
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
      ),
    );
  }
}
