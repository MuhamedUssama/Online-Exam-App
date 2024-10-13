import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_weight_helper.dart';

abstract class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );

  static TextStyle font14BlueSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
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
}
