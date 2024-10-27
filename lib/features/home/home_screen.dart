import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/test_style.dart';
import '../../core/di/di.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/images_path.dart';
import 'home_screen_states.dart';
import 'home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenViewModel viewModel = getIt.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: _buildAppBarTitle(viewModel.currentIndex),
          ),
          body: IndexedStack(
            index: viewModel.currentIndex,
            children: viewModel.tabs,
          ),
          bottomNavigationBar: _bottomNavigationBarWidget(),
        );
      },
    );
  }

  Widget _buildAppBarTitle(int index) {
    return index == 0
        ? Text(AppStrings.surveyText, style: TextStyles.font16BaseBlueRegular)
        : index == 1
            ? Text(
                AppStrings.resultText,
                style: TextStyles.font20BaseDarkMedium,
              )
            : Text(
                AppStrings.profileText,
                style: TextStyles.font20BaseDarkMedium,
              );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      backgroundColor: ColorsManager.lightBlue,
      currentIndex: viewModel.currentIndex,
      selectedItemColor: ColorsManager.baseBlue,
      unselectedItemColor: ColorsManager.black30,
      selectedLabelStyle: TextStyles.text12BaseBlueSemiBold,
      unselectedLabelStyle: TextStyles.text12black30SemiBold,
      onTap: (index) {
        viewModel.onTabClicked(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: _buildIconWithBackground(
            icon: const ImageIcon(AssetImage(IconsPath.exploreIcon)),
            isSelected: viewModel.currentIndex == 0,
          ),
          label: AppStrings.exploreText,
          backgroundColor: ColorsManager.blue10,
        ),
        BottomNavigationBarItem(
          icon: _buildIconWithBackground(
            icon: const ImageIcon(AssetImage(IconsPath.resultIcon)),
            isSelected: viewModel.currentIndex == 1,
          ),
          label: AppStrings.resultText,
        ),
        BottomNavigationBarItem(
          icon: _buildIconWithBackground(
            icon: const ImageIcon(AssetImage(IconsPath.profileIcon)),
            isSelected: viewModel.currentIndex == 2,
          ),
          label: AppStrings.profileText,
        ),
      ],
    );
  }

  Widget _buildIconWithBackground({
    required Widget icon,
    required bool isSelected,
  }) {
    return Container(
      height: 32.h,
      width: 64.w,
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.blue20 : Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: icon,
    );
  }
}
