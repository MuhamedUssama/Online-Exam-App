import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/theme/test_style.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/cubit/explore_tab_actions.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/cubit/explore_tab_states.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/cubit/explore_tab_view_model.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/widgets/explore_tab_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Column(
      children: [
        const Padding(
          padding:  EdgeInsets.all(8.0),
          child:  TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            ),
          ),
        ),
         Row(
          children: [
             Padding(
               padding:const EdgeInsets.all(8.0),
               child: Text('Browse by subject',style:TextStyles.font18BaseDarkMedium  ,),
             ),
          ],
        ),
        Expanded(
          child: BlocBuilder<ExploreTabViewModel, ExploreTabStates>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is ExploreTabLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ExploreTabErrorState) {
                return Center(
                    child: Text(
                  state.errorMessage ?? "",
                  style: TextStyles.font16BaseBlackRegular,
                ));
              } else if (state is ExploreTabSuccessState) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return ExploreTabCardWidget(state.entity!.subjects![index]);
                    },
                    separatorBuilder: (context, index) =>  SizedBox(
                          height: 16.h,
                        ),
                    itemCount: state.entity!.subjects!.length);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
