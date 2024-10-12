import 'package:flutter/material.dart';
import 'package:online_exam_app/config/router/routes_name.dart';
import 'package:online_exam_app/features/auth/ui/signUp/sign_up_screen.dart';

import '../../features/auth/ui/login/login_screen.dart';


class AppRouters {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder:(context) =>  LoginScreen(),
        );
      case RoutesName.signUpScreen:
        return MaterialPageRoute(
          builder:(context) =>  SignUpScreen(),
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
