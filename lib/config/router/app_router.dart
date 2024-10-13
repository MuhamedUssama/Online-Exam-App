import 'package:flutter/material.dart';

import '../../features/forget_password/presentation/email_verification_screen.dart';
import '../../features/forget_password/presentation/forget_password_screen.dart';
import '../../features/forget_password/presentation/reset_password_screen.dart';
import 'routes_name.dart';

class AppRouters {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );

      case RoutesName.verifyEmailScreen:
        return MaterialPageRoute(
          builder: (context) => const EmailVerificationScreen(),
        );

      case RoutesName.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );

      default:
        return MaterialPageRoute(builder: (context) => unDefinePageRoute());
    }
  }

  static Widget unDefinePageRoute() {
    return const Scaffold(
      body: Center(
        child: Text("Un Defined PageRoute"),
      ),
    );
  }
}
