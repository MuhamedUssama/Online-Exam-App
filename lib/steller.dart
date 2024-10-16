import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/router/app_router.dart';

import 'config/router/routes_name.dart';

class Steller extends StatelessWidget {
  const Steller({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Steller App',
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.forgetPasswordScreen,
        onGenerateRoute: (settings) => AppRouters.onGenerate(settings),
      ),
    );
  }
}
