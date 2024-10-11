import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/app_colors.dart';
import '../../../core/di/di.dart';
import '../../../core/utils/dialog_utils.dart';
import 'view_models/email_verification_view_model/email_verification_states.dart';
import 'view_models/email_verification_view_model/email_verification_view_model.dart';

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
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Email verification',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Please enter your code that send to your\n email address ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Form(
                key: viewModel.formKey,
                child: TextFormField(
                  controller: viewModel.codeController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email address";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: ColorsManager.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(
                      color: ColorsManager.placeHolder,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorsManager.baseBlack,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorsManager.baseBlack,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              ElevatedButton(
                onPressed: () {
                  viewModel.doIntent(EmailVerificationAction());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.baseBlue,
                  fixedSize: Size.fromWidth(width),
                  padding: EdgeInsetsDirectional.symmetric(vertical: 12.h),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
