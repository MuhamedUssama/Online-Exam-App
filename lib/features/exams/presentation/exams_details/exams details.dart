import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';
import 'package:online_exam_app/config/theme/test_style.dart';
import 'package:online_exam_app/core/cache/shared_preferences.dart';
import 'package:online_exam_app/core/utils/images_path.dart';
import 'package:online_exam_app/core/widgets/custom_blue_button.dart';
import 'package:online_exam_app/features/question/presentation/questions_screen.dart';

import '../../domain/entities/exams_entity.dart';

class ExamsDetails extends StatelessWidget {
  final ExamsEntity? entity;
  const ExamsDetails({this.entity,super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
              Image.asset(IconsPath.examIcon,width: 42.w,height:47.h ,fit: BoxFit.cover,),
                  SizedBox(width:8.w ,),
                  Text(entity?.title??"",style: TextStyles.font20BaseDarkMedium,),
                              SizedBox(width:mediaQuery *0.3,),
                              Text('${entity?.duration??0} Minutes',style: TextStyles.font14BaseBlueRegular,),

            ],),
            Row(
              children: [
                Text('${entity?.numberOfQuestions} Question',style: TextStyles.font16GreyRegular,),
              ],
            ),
            Container(
              width: mediaQuery *1,
              height: 1,
              color: ColorsManager.grey,
              margin:const EdgeInsets.symmetric(vertical: 40),
            ),
            CustomBlueButton(width:mediaQuery *1, onPresed: (){
              SharedPreferencesHelper.saveData(key: 'examId', value: entity?.id);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionsScreen(),));
            }, text: 'Start')
          ],
        ),
      ) ,
    );
  }
}
