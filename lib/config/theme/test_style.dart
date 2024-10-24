import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';

import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font16BlackRegular = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.baseBlack,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );

  static TextStyle font18BaseDarkMedium = TextStyle(
    color: ColorsManager.baseBlack,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14GreyRegular = TextStyle(
    color: ColorsManager.grey,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16BaseBlackRegular = TextStyle(
    color: ColorsManager.baseBlack,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16BaseBlueRegular = TextStyle(
    color: ColorsManager.baseBlue,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    decoration: TextDecoration.underline,
  );

  static TextStyle font20BaseDarkMedium = TextStyle(
    color: ColorsManager.baseBlack,
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14PlaceHolderRegular = TextStyle(
    color: ColorsManager.placeHolder,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font14BaseBlackRegular = TextStyle(
    color: ColorsManager.baseBlack,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle elevatedButtonWhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );

  static TextStyle textButtonBaseBlueRegular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 16.sp,
    decoration: TextDecoration.underline,
    color: ColorsManager.baseBlue,
  );
  static TextStyle text12ButtonBaseBlackRegular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 12.sp,
    decoration: TextDecoration.underline,
    color: ColorsManager.baseBlack,
  );

  static TextStyle text12BaseBlueSemiBold = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 12.sp,
    color: ColorsManager.baseBlue,
  );

  static TextStyle text12black30SemiBold = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 12.sp,
    color: ColorsManager.black30,
  );
}
