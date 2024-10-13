import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/test_style.dart';
import '../../../core/di/di.dart';
import '../../../core/utils/dialog_utils.dart';
import 'view_models/email_verification_view_model/email_verification_states.dart';
import 'view_models/email_verification_view_model/email_verification_view_model.dart';
import 'widgets/custom_otp_widget.dart';

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
        title: Text('Password', style: TextStyles.font20BaseDarkMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            BlocListener<EmailVerificationViewModel, EmailVerificationStates>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is EmailVerificationLoadingState) {
              DialogUtils.showLoading(context, state.message);
            } else if (state is EmailVerificationErrorState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                context,
                title: "Error",
                contentMessage: state.errorMessage ?? "Somthing went wrong",
                posActionName: "Ok",
              );
            } else if (state is EmailVerificationSuccessState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                context,
                title: "Successfully",
                contentMessage:
                    "Check your email please, we will send to you a verification code in 60s.",
                posActionName: "Ok",
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Email verification',
                style: TextStyles.font18BaseDarkMedium,
              ),
              SizedBox(height: 16.h),
              Text(
                'Please enter your code that send to your\n email address ',
                style: TextStyles.font14GreyRegular,
                textAlign: TextAlign.center,
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
                    "Didn't receive code?",
                    style: TextStyles.font16BaseBlackRegular,
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.doIntent(ResendCodeAction());
                    },
                    child: Text(
                      "Resend",
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
