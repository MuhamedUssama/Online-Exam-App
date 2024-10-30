import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/app_colors.dart';
import '../../../../../../config/theme/test_style.dart';
import '../../../../../../core/utils/app_dialogs.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/custom_blue_button.dart';
import '../../../../../../core/widgets/custom_form_field.dart';
import '../../change_user_password_screen.dart';
import '../view_models/user_profile_view_model/user_profile_screen_actions.dart';
import '../view_models/user_profile_view_model/user_profile_states.dart';
import '../view_models/user_profile_view_model/user_profile_view_model.dart';
import 'profile_tab_error_widget.dart';

class UserProfileFormWidget extends StatelessWidget {
  final UserProfileViewModel viewModel;

  const UserProfileFormWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: viewModel,
      listener: (context, state) {
        if (state is UserProfileUpdateInfoLoadingState) {
          AppDialogs.showLoading(
            message: AppStrings.loadingText,
            context: context,
          );
        } else if (state is UserProfileUpdateInfoErrorState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showFailDialog(
            message: state.message ?? AppStrings.somethingWentWrong,
            context: context,
            posActionTitle: AppStrings.ok,
          );
        } else if (state is EditProfileSuccessState) {
          AppDialogs.hideLoading(context);
          AppDialogs.showSuccessDialog(
            message: state.editedUserData?.message ??
                AppStrings.userProfileEditedSucceessfully,
            context: context,
            posActionTitle: AppStrings.ok,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is GetLoggedUserDataSuccessState ||
          current is UserProfileGetInfoLoadingState ||
          current is UserProfileGetInfoErrorState,
      builder: (context, state) {
        if (state is GetLoggedUserDataSuccessState) {
          return Column(
            children: [
              CustomFormFiled(
                hintText: AppStrings.userNameHintText,
                labelText: AppStrings.userNameLabelText,
                controller: viewModel.userNameController,
                style: TextStyles.font16BaseBlackRegular,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomFormFiled(
                      hintText: AppStrings.firstNameHintText,
                      labelText: AppStrings.firstNameLabelText,
                      controller: viewModel.firstNameController,
                      style: TextStyles.font16BaseBlackRegular,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomFormFiled(
                      hintText: AppStrings.lastNameHintText,
                      labelText: AppStrings.lastNameLabelText,
                      controller: viewModel.lastNameController,
                      style: TextStyles.font16BaseBlackRegular,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              CustomFormFiled(
                hintText: AppStrings.emailHintText,
                labelText: AppStrings.emailLabelText,
                controller: viewModel.emailController,
                style: TextStyles.font16BaseBlackRegular,
              ),
              SizedBox(height: 24.h),
              CustomFormFiled(
                hintText: AppStrings.passwordHintText,
                labelText: AppStrings.passwordLabelText,
                controller: viewModel.passwordController,
                style: TextStyles.font16BaseBlackRegular,
                secureText: true,
                suffixIcon: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeUserPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppStrings.changeText,
                    style: TextStyles.text12BaseBlueSemiBold,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomFormFiled(
                hintText: AppStrings.phoneHintText,
                labelText: AppStrings.phoneLabelText,
                controller: viewModel.phoneController,
                style: TextStyles.font16BaseBlackRegular,
              ),
              SizedBox(height: 48.h),
              CustomBlueButton(
                width: MediaQuery.sizeOf(context).width,
                text: AppStrings.updateText,
                onPresed: () {
                  viewModel.doIntent(UpdateUserProfileAction());
                },
              ),
            ],
          );
        } else if (state is UserProfileGetInfoLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.baseBlue,
            ),
          );
        } else if (state is UserProfileGetInfoErrorState) {
          return ProfileTabErrorWidget(
            errorMessage: state.message ?? AppStrings.somethingWentWrong,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.baseBlue,
            ),
          );
        }
      },
    );
  }
}
