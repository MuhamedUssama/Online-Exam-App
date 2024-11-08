import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/features/auth/login_and_signup/ui/login/login_screen.dart';

import '../../../../../../config/theme/app_colors.dart';
import '../../../../../../config/theme/test_style.dart';
import '../../../../../../core/utils/app_strings.dart';

class ProfileTabErrorWidget extends StatelessWidget {
  final String errorMessage;
  const ProfileTabErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.baseBlack.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(errorMessage, style: TextStyles.font18BaseDarkMedium),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.errorColor,
              fixedSize: Size.fromWidth(MediaQuery.sizeOf(context).width),
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
            ),
            child: Text(
              AppStrings.loginTitle,
              style: TextStyles.font16WhiteMedium,
            ),
          ),
        ],
      ),
    );
  }
}
