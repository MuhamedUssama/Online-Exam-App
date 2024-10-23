import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/test_style.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/custom_blue_button.dart';
import '../../../../core/widgets/custom_form_field.dart';
import 'view_models/forget_password_view_model/forget_password_states.dart';
import 'view_models/forget_password_view_model/forget_password_view_model.dart';
import 'widgets/forget_password_bloc_listener.dart';
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
        child: ForgetPasswordBlocListener(
          viewModel: viewModel,
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
