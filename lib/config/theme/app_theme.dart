import 'package:flutter/material.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(ColorsManager.baseBlue),
      ),
    )
      // scaffoldBackgroundColor: Colors.white,
      );
}
