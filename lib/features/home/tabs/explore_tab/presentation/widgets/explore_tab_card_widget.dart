import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subjects_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/theme/test_style.dart';

class ExploreTabCardWidget extends StatelessWidget {
  final SubjectsEntity subject;
  const ExploreTabCardWidget(this.subject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            height: 80.h,
            child: InkWell(
              onTap: (){},
              child: Card(
                child: Row(
                  children: [
                     SizedBox(
                      width: 24.w,
                    ),
                    CachedNetworkImage(imageUrl:subject.icon??"",width: 48,height: 48,),
                     SizedBox(
                      width: 14.5.w,
                    ),
                     Text(subject.name??"",style: TextStyles.font16BlackRegular,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
