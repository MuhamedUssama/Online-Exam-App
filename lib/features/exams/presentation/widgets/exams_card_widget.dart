import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/images_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/theme/test_style.dart';
import '../../domain/entities/exams_entity.dart';
import '../exams_details/exams details.dart';

class ExamsCardWidget extends StatelessWidget {
  final ExamsEntity exam;
  const ExamsCardWidget(this.exam, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ExamsDetails(entity: exam,),));
      },
      child: SizedBox(
        height:103 ,
        child: Card(
          child: Row(
            children: [
              SizedBox(
                width: 24.w,
              ),
              Image.asset(
                IconsPath.examIcon,
                height: 71.h,
                width: 60.w,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                children: [
                  SizedBox(
                    width:MediaQuery.of(context).size.width *0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Column(
                          children: [
                            Text(exam.title ?? "",style: TextStyles.font16BaseBlackRegular,),
                            Text('${exam.numberOfQuestions ?? ""} Question',style: TextStyles.font14GreyRegular,),
                          ],
                        ),
                        Text('${exam.duration ?? ""} Minutes',style: TextStyles.font14BaseBlueRegular,),
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
