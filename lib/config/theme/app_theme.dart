import 'package:flutter/material.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(ColorsManager.baseBlue),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
      ),
    ),
  );
}
