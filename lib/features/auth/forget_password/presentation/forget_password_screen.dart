import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/test_style.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/custom_blue_button.dart';
import '../../../../core/widgets/custom_form_field.dart';
import 'email_verification_screen.dart';
import 'view_models/forget_password_view_model/forget_password_states.dart';
import 'view_models/forget_password_view_model/forget_password_view_model.dart';
import 'widgets/screen_description_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordViewModel viewModel = getIt.get<ForgetPasswordViewModel>();
  @override
  void dispose() {
    viewModel.emailController.dispose();
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is ForgetPasswordLoadingState) {
              DialogUtils.showLoading(context, state.message);
            } else if (state is ForgetPasswordErrorState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                context,
                title: "Error",
                contentMessage: state.errorMessage ?? "Somthing went wrong",
                posActionName: "Ok",
              );
            } else if (state is ForgetPasswordSuccessState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                context,
                title: "Successfully",
                contentMessage:
                    "Check your email please, we will send to you a verification code in 60s.",
                posActionName: "Ok",
                posActionFunction: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmailVerificationScreen(),
                    ),
                  );
                },
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ScreenDescriptionWidget(
                title: AppStrings.forgetPasswordScreenTitle,
                description: AppStrings.forgetPasswordScreenDescription,
              ),
              SizedBox(height: 32.h),
              Form(
                key: viewModel.formKey,
                child: CustomFormFiled(
                  controller: viewModel.emailController,
                  hintText: AppStrings.emailHintText,
                  labelText: AppStrings.emailLabelText,
                  validator: (value) {
                    return AppValidator.validateEmailAddress(value);
                  },
                ),
              ),
              SizedBox(height: 48.h),
              CustomBlueButton(
                width: width,
                text: AppStrings.continueText,
                onPresed: () {
                  viewModel.doIntent(ForgetPasswordAction());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
