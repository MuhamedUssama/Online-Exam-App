import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/forget_password/presentation/email_verification_screen.dart';
import 'features/forget_password/presentation/forget_password_screen.dart';

class Steller extends StatelessWidget {
  const Steller({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Steller App',
        home: EmailVerificationScreen(),
      ),
    );
  }
}
