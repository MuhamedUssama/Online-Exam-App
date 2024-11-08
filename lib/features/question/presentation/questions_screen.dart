import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/features/question/domain/entities/questions_entity.dart';
import 'package:online_exam_app/features/question/presentation/cubit/questions_actions.dart';
import 'package:online_exam_app/features/question/presentation/cubit/questions_states.dart';

import '../../../core/di/di.dart';
import '../../../core/utils/animation_assets.dart';
import 'cubit/questions_view_model.dart';

class QuestionsScreen extends StatefulWidget {
  final QuestionsEntity? entity;
    const QuestionsScreen({this.entity,super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();



}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _selectedOption = -1;
  final QuestionsViewModel viewModel = getIt<QuestionsViewModel>();
  @override
  void initState() {
    viewModel.doIntent(action: QuestionsIntent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocBuilder<QuestionsViewModel, QuestionsStates>(
        bloc: viewModel,
        builder: (context, state) {
          int? ind;
          if (state is QuestionsLoadingState) {
            return  Center(child: Lottie.asset(AnimationsAssets.loading),);
          } else if (state is QuestionsErrorState) {
            return Center(
                child: Text(
                  state.errorMessage ?? "",

                ));
          } else if (state is QuestionsSuccessState) {
            if (state.entity!.questions!.isEmpty){
              return Center(child: Lottie.asset(AnimationsAssets.noData));

            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  final question = state.entity!.questions![index].answers!;
                  return Column(
                    children: [
                      for (int i = 0 ;i<question.length;i++)
                    RadioListTile<int>
                      (value: index, groupValue: _selectedOption,title: Text(question[i].answer??""), onChanged: (value){
                      setState(() {
                        _selectedOption = value!;
                      });
                    })


                    ]
                  );

                },
                separatorBuilder: (context, index) =>  SizedBox(
                  height: 16.h,
                ),
                itemCount: state.entity!.questions![ind??0].answers!.length);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ) ,
    );
  }
}
