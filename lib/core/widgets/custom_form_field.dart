import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/test_style.dart';

typedef Validator = String? Function(String?);

class CustomFormFiled extends StatelessWidget {
  final String hintText;
  final String labelText;
  TextInputType keyboardType;
  bool secureText;
  Validator? validator;
  TextEditingController? controller;
  int lines;
  TextStyle? style;
  String? initial;

  CustomFormFiled({
    super.key,
    required this.hintText,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.secureText = false,
    this.validator,
    this.controller,
    this.lines = 1,
    this.style,
    this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: lines,
      maxLines: lines,
      controller: controller,
      validator: validator,
      obscureText: secureText,
      keyboardType: keyboardType,
      style: style,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.font14PlaceHolderRegular,
        labelText: labelText,
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.errorColor)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.errorColor)),
        border: const OutlineInputBorder(borderSide: BorderSide(width: 2)),
      ),
    );
  }
}
