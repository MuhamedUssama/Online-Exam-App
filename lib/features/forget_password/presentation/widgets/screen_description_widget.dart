import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/test_style.dart';

class ScreenDescriptionWidget extends StatelessWidget {
  final String title;
  final String description;

  const ScreenDescriptionWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyles.font18BaseDarkMedium,
        ),
        SizedBox(height: 16.h),
        Text(
          description,
          style: TextStyles.font14GreyRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
