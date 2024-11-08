import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/router/app_router.dart';
import 'package:online_exam_app/config/theme/app_theme.dart';

class Steller extends StatelessWidget {
  final String initialRoute;
  const Steller({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Steller App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData,
        initialRoute: initialRoute,
        onGenerateRoute: (settings) => AppRouters.onGenerate(settings),
      ),
    );
  }
}
