import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_screen_states.dart';
import 'tabs/explore_tab/presentation/explore_tab.dart';
import 'tabs/profile_tab/presentation/profile_tab.dart';
import 'tabs/results_tab/presentation/results_tab.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  @factoryMethod
  HomeScreenViewModel() : super(ExploreTabState());

  int currentIndex = 0;

  List<Widget> tabs = [
    const ExploreTab(),
    const ResultsTab(),
    const ProfileTab(),
  ];

  void onTabClicked(int tabIndex) {
    if (currentIndex != tabIndex) {
      currentIndex = tabIndex;
      if (tabIndex == 0) {
        emit(ExploreTabState());
      } else if (tabIndex == 1) {
        emit(ResultTabState());
      } else if (tabIndex == 2) {
        emit(ProfileTabState());
      }
    }
  }
}
