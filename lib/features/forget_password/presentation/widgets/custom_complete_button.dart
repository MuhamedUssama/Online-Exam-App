import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/test_style.dart';

class CustomCompleteButton extends StatelessWidget {
  final double width;
  final Function onPresed;

  const CustomCompleteButton({
    super.key,
    required this.width,
    required this.onPresed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPresed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.baseBlue,
        fixedSize: Size.fromWidth(width),
        padding: EdgeInsetsDirectional.symmetric(vertical: 12.h),
      ),
      child: Text(
        'Continue',
        style: TextStyles.font16WhiteMedium,
      ),
    );
  }
}
