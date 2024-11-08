import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/app_colors.dart';
import '../../../../../../core/utils/images_path.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesPath.defultUserImage),
            ),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            color: ColorsManager.blue40,
            borderRadius: BorderRadius.circular(8.r),
            image: const DecorationImage(
              image: AssetImage(IconsPath.cameraIcon),
            ),
          ),
        ),
      ],
    );
  }
}
