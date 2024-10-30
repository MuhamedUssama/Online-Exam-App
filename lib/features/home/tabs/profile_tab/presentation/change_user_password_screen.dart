import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/home/home_screen.dart';

import '../../../../../config/theme/test_style.dart';
import '../../../../../core/utils/app_dialogs.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/validation_utils.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import 'view_models/change_password_view_model.dart/change_password_actions.dart';
import 'view_models/change_password_view_model.dart/change_password_states.dart';
import 'view_models/change_password_view_model.dart/change_password_view_model.dart';

class ChangeUserPasswordScreen extends StatefulWidget {
  const ChangeUserPasswordScreen({super.key});

  @override
  State<ChangeUserPasswordScreen> createState() =>
      _ChangeUserPasswordScreenState();
}

class _ChangeUserPasswordScreenState extends State<ChangeUserPasswordScreen> {
  late ChangePasswordViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ChangePasswordViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.currentPasswordController.dispose();
    viewModel.newPasswordController.dispose();
    viewModel.confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.resetPasswordScreenTitle),
        titleTextStyle: TextStyles.font20BaseDarkMedium,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Form(
            key: viewModel.formKey,
            child: BlocListener<ChangePasswordViewModel, ChangePasswordStates>(
              bloc: viewModel,
              listener: (context, state) {
                if (state is ChangePasswordLoadingState) {
                  AppDialogs.showLoading(
                    message: AppStrings.loadingText,
                    context: context,
                  );
                } else if (state is ChangePasswordFailureState) {
                  AppDialogs.hideLoading(context);
                  AppDialogs.showFailDialog(
                    message:
                        state.errorMessage ?? AppStrings.somethingWentWrong,
                    context: context,
                    posActionTitle: AppStrings.ok,
                  );
                } else if (state is ChangePasswordSuccessState) {
                  AppDialogs.hideLoading(context);
                  AppDialogs.showSuccessDialog(
                    message: state.changePasswordEntity?.message ??
                        AppStrings.userProfileEditedSucceessfully,
                    context: context,
                    posActionTitle: AppStrings.ok,
                    posAction: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  );
                }
              },
              child: Column(
                children: [
                  CustomFormFiled(
                    hintText: AppStrings.currentPassword,
                    labelText: AppStrings.currentPassword,
                    controller: viewModel.currentPasswordController,
                    secureText: viewModel.isObscureCurrentPassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (viewModel.isObscureCurrentPassword) {
                            viewModel.isObscureCurrentPassword = false;
                          } else {
                            viewModel.isObscureCurrentPassword = true;
                          }
                        });
                      },
                      child: viewModel.isObscureCurrentPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    validator: (value) {
                      return AppValidator.validateFieldIsNotEmpty(
                        value: value,
                        message: AppStrings.emptyPassword,
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  CustomFormFiled(
                    hintText: AppStrings.passwordHintText,
                    labelText: AppStrings.newPasswordLabelText,
                    controller: viewModel.newPasswordController,
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
                      return AppValidator.validateFieldIsNotEmpty(
                        value: value,
                        message: AppStrings.emptyPassword,
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  CustomFormFiled(
                    hintText: AppStrings.confirmPasswordHintText,
                    labelText: AppStrings.confirmPasswordLabelText,
                    controller: viewModel.confirmPasswordController,
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
                      return AppValidator.validateConfirmPassword(
                        confirmPassword: value,
                        password: viewModel.newPasswordController.text,
                      );
                    },
                  ),
                  SizedBox(height: 48.h),
                  CustomBlueButton(
                    width: MediaQuery.sizeOf(context).width,
                    text: AppStrings.updateText,
                    onPresed: () {
                      viewModel.doIntent(UpdateUserPasswordAction());
                    },
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
