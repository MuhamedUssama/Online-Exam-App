import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/test_style.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/app_strings.dart';
import 'view_models/email_verification_view_model/email_verification_actions.dart';
import 'view_models/email_verification_view_model/email_verification_view_model.dart';
import 'widgets/custom_otp_widget.dart';
import 'widgets/email_verivication_bloc_listener.dart';
import 'widgets/screen_description_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  EmailVerificationViewModel viewModel =
      getIt.get<EmailVerificationViewModel>();
  @override
  void dispose() {
    viewModel.codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.passwordAppBarTitle,
          style: TextStyles.font20BaseDarkMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: EmailVerivicationBlocListener(
          viewModel: viewModel,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ScreenDescriptionWidget(
                title: AppStrings.emailVerivicationScreenTitle,
                description: AppStrings.emailVerivicationScreenDescription,
              ),
              SizedBox(height: 32.h),
              Form(
                key: viewModel.formKey,
                child: CustomOtpWidget(
                  controller: viewModel.codeController,
                  onComplete: () {
                    viewModel.doIntent(VerifyEmailAction());
                  },
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.didnotRcieveCode,
                    style: TextStyles.font16BaseBlackRegular,
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.doIntent(ResendCodeAction());
                    },
                    child: Text(
                      AppStrings.resendText,
                      style: TextStyles.font16BaseBlueRegular,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
