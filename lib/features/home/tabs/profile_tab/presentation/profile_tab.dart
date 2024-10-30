import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';

import 'view_models/user_profile_view_model/user_profile_screen_actions.dart';
import 'view_models/user_profile_view_model/user_profile_view_model.dart';
import 'widgets/user_image_widget.dart';
import 'widgets/user_profile_form_widget.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late UserProfileViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<UserProfileViewModel>();
    viewModel.doIntent(GetLoggedUserDataAction());
    super.initState();
  }

  @override
  void dispose() {
    viewModel.userNameController.dispose();
    viewModel.emailController.dispose();
    viewModel.passwordController.dispose();
    viewModel.firstNameController.dispose();
    viewModel.lastNameController.dispose();
    viewModel.phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          children: [
            const UserImageWidget(),
            SizedBox(height: 24.h),
            UserProfileFormWidget(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
