import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/test_style.dart';

typedef Validator = String? Function(String?);

// ignore: must_be_immutable
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
  Widget? suffixIcon;

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
    this.suffixIcon,
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
      cursorColor: ColorsManager.baseBlack,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: ColorsManager.grey,
        hintText: hintText,
        hintStyle: TextStyles.font14PlaceHolderRegular,
        labelText: labelText,
        labelStyle: TextStyles.font14BaseBlackRegular,
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.errorColor)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.errorColor)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.baseBlack),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.baseBlack),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.baseBlack),
        ),
      ),
    );
  }
}
