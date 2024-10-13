import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';

import '../../../config/theme/test_style.dart';
import '../../../core/di/di.dart';
import '../../../core/utils/dialog_utils.dart';
import 'email_verification_screen.dart';
import 'view_models/forget_password_view_model/forget_password_states.dart';
import 'view_models/forget_password_view_model/forget_password_view_model.dart';

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
        title: Text('Password', style: TextStyles.font20BaseDarkMedium),
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
              Text(
                'Forget Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Please enter your email associated to\n your account',
                style: TextStyles.font14GreyRegular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Form(
                key: viewModel.formKey,
                child: TextFormField(
                  controller: viewModel.emailController,
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
                onPressed: () async {
                  await viewModel.forgetPassword();
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
