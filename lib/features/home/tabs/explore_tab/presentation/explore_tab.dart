import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/cubit/explore_tab_actions.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/cubit/explore_tab_states.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/cubit/explore_tab_view_model.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/widgets/explore_tab_card_widget.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  ExploreTabViewModel viewModel = getIt<ExploreTabViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(action: ExploreTabIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreTabViewModel, ExploreTabStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ExploreTabSuccessState) {
          return ExploreTabCardWidget();
        } else if (state is ExploreTabErrorState) {
          print(state.errorMessage);
        }
        return ExploreTabCardWidget();
      },
    );
  }
}
