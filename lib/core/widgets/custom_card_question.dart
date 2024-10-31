import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/images_path.dart';

import '../../config/theme/test_style.dart';

class CustomCardQuestion extends StatelessWidget {
  final String? level;
  final int? questions;
  final double? from;
  final double? to;
  final int? duration;

  const CustomCardQuestion({
    Key? key,
    this.level,
    this.questions,
    this.from,
    this.to,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(SvgPath.timeIcon),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(level!, style: TextStyles.font18BaseDarkMedium),
                  const SizedBox(height: 4),
                  Text('$questions Question',
                      style: TextStyles.font14GreyRegular),
                  const SizedBox(height: 8),
                  Text('From: $from   To: $to',
                      style: TextStyles.font14BaseBlackRegular),
                ],
              ),
            ),
            Text('$duration Minutes', style: TextStyles.font16BaseBlueRegular),
          ],
        ),
      ),
    );
  }
}
