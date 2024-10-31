import 'package:flutter/material.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';

import '../../../../../config/theme/test_style.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/images_path.dart';

class LanguageQuestionBody extends StatelessWidget {
  const LanguageQuestionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(SvgPath.timeIcon),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                Text(AppStrings.languageText),
                const SizedBox(width: 25),
                Text(
                  '30Minutes',
                  style: TextStyles.font16BaseBlueRegular,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'High level',
              style: TextStyles.font16BaseBlueRegular,
            ),
            Divider(color: ColorsManager.blue40),
            Text(
              '20 Questions',
              style: TextStyles.font16BaseBlueRegular,
            ),
            const SizedBox(height: 12),
            Text(
              'Lorem ipsum dolor sit amet consectetur.\n'
              'Lorem ipsum dolor sit amet consectetur.\n'
              'Lorem ipsum dolor sit amet consectetur.\n'
              'Lorem ipsum dolor sit amet consectetur.',
              style: TextStyles.font16BaseBlueRegular,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.startText,
                style: TextStyles.textButtonBaseBlueRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
