import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/features/exams/presentation/widgets/exams_card_widget.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subjects_entity.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/utils/animation_assets.dart';
import 'cubit/exams_actions.dart';
import 'cubit/exams_states.dart';
import 'cubit/exams_view_model.dart';

class ExamsScreen extends StatefulWidget {
  final SubjectsEntity? subject;
   const ExamsScreen({this.subject,super.key});

  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  ExamsViewModel viewModel = getIt<ExamsViewModel>();
  @override
  void initState() {
    viewModel.doIntent(action: ExamsIntent());
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.subject?.name??"" ,

        ),),
      body:BlocBuilder<ExamsViewModel, ExamsStates>(
            bloc: viewModel,
            builder: (context, state) {
      if (state is ExamsLoadingState) {
        return  Center(child: Lottie.asset(AnimationsAssets.loading),);
      } else if (state is ExamsErrorState) {
        return Center(
            child: Text(
              state.errorMessage ?? "",

            ));
      } else if (state is ExamsSuccessState) {
        if (state.entity!.exams!.isEmpty){
          return Center(child: Lottie.asset(AnimationsAssets.noData));
        }
        return ListView.separated(
            itemBuilder: (context, index) {

              return ExamsCardWidget(state.entity!.exams![index]);
            },
            separatorBuilder: (context, index) =>  SizedBox(
              height: 16.h,
            ),
            itemCount: state.entity!.exams!.length);
      }
      return const Center(child: CircularProgressIndicator());
            },
            ) ,
    );
  }
}
