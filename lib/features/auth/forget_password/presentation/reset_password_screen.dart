import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';

import '../../../../config/theme/test_style.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/custom_blue_button.dart';
import '../../../../core/widgets/custom_form_field.dart';
import 'view_models/reset_password_view_model/reset_password_actions.dart';
import 'view_models/reset_password_view_model/reset_password_view_model.dart';
import 'widgets/reset_password_bloc_listener.dart';
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
        title: Text(
          AppStrings.passwordAppBarTitle,
          style: TextStyles.font20BaseDarkMedium,
        ),
      ),
      body: ResetPasswordBlocListener(
        viewModel: viewModel,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ScreenDescriptionWidget(
                  title: AppStrings.resetPasswordScreenTitle,
                  description: AppStrings.resetPasswordScreenDescription,
                ),
                SizedBox(height: 32.h),
                CustomFormFiled(
                  hintText: AppStrings.passwordHintText,
                  labelText: AppStrings.newPasswordLabelText,
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
                    return AppValidator.validateConfirmPassword(
                      confirmPassword: value,
                      password: viewModel.newPassword.text,
                    );
                  },
                ),
                SizedBox(height: 48.h),
                CustomBlueButton(
                  width: width,
                  text: AppStrings.continueText,
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
