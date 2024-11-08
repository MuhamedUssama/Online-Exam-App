import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/test_style.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/validation_utils.dart';

class CustomOtpWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function onComplete;

  const CustomOtpWidget({
    super.key,
    required this.controller,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      crossAxisAlignment: CrossAxisAlignment.end,
      closeKeyboardWhenCompleted: true,
      length: 6,
      onCompleted: (value) {
        onComplete();
      },
      defaultPinTheme: PinTheme(
        textStyle: TextStyles.font18BaseDarkMedium,
        height: 60.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: ColorsManager.pinCode,
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      errorPinTheme: PinTheme(
        height: 60.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: ColorsManager.errorColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      errorTextStyle: const TextStyle(color: ColorsManager.errorColor),
      keyboardType: TextInputType.number,
      validator: (pin) {
        return AppValidator.validateFieldIsNotEmpty(
          value: pin,
          message: AppStrings.invalidCode,
        );
      },
    );
  }
}
