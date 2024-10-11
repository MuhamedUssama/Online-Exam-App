import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';

import '../../../core/di/di.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
