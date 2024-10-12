import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/router/app_router.dart';
import 'package:online_exam_app/config/theme/app_theme.dart';

import 'config/router/routes_name.dart';

class Steller extends StatelessWidget {
  const Steller({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.lightThemeData,
      title: 'Steller App',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.signUpScreen,
      onGenerateRoute: (settings) => AppRouters.onGenerate(settings),
    );
  }
}
