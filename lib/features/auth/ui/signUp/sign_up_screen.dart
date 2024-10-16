import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/router/app_router.dart';
import 'package:online_exam_app/config/router/routes_name.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';
import 'package:online_exam_app/core/di/di.dart';

import '../../../../config/theme/test_style.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/custom_form_field.dart';
import 'cubit/sign_up_states.dart';
import 'cubit/sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var viewModel = getIt<SignUpViewModel>();
  @override
  void dispose() {
    viewModel.username.dispose();
    viewModel.firstName.dispose();
    viewModel.lastName.dispose();
    viewModel.password.dispose();
    viewModel.rePassword.dispose();
    viewModel.phone.dispose();
    viewModel.email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: BlocListener<SignUpViewModel, SignUpStates>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is SignUpLoadingState) {
              DialogUtils.showLoading(context, 'LOADING');
            } else if (state is SignUpErrorState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                  contentMessage: state.errorMessage ?? "Please Try Again",
                  title: 'Error',posActionName: 'Ok');
            } else if (state is SignUpSuccessState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                  contentMessage: 'User Logged In Successfully',
                  title: 'Success',posActionName: 'Ok');
            }
          },
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormFiled(
                            labelText: 'Enter Your Username',
                            hintText: 'Enter Username',
                            controller: viewModel.username,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Enter Username';
                              }

                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormFiled(
                            labelText: 'Enter Your First Name',
                            hintText: 'Enter First Name',
                            controller: viewModel.firstName,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Enter First Name';
                              }

                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormFiled(
                            labelText: 'Enter Your Last Name',
                            hintText: 'Enter Last Name',
                            controller: viewModel.lastName,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Enter Last Name';
                              }

                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormFiled(
                            labelText: 'Enter Your E-Mail',
                            hintText: 'Enter E-Mail',
                            controller: viewModel.email,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return ' Enter E-Mail';
                              }
                              if (!isValidEmail(text)) {
                                return ' Enter Valid Email';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormFiled(
                            labelText: 'Enter Your Password',
                            hintText: 'Password',
                            controller: viewModel.password,
                            secureText: viewModel.isObscurePassword,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (viewModel.isObscurePassword) {
                                    viewModel.isObscurePassword = false;
                                  } else {
                                    viewModel.isObscurePassword = true;
                                  }
                                });
                              },
                              child: viewModel.isObscurePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Enter Password';
                              }
                              if (!isValidPassword(text)) {
                                return 'Enter Valid Password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormFiled(
                            labelText: 'Confirm Password',
                            hintText: 'Confirm Password',
                            controller: viewModel.rePassword,
                            secureText: viewModel.isObscureRePassword,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (viewModel.isObscureRePassword) {
                                    viewModel.isObscureRePassword = false;
                                  } else {
                                    viewModel.isObscureRePassword = true;
                                  }
                                });
                              },
                              child: viewModel.isObscureRePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Enter Confirm Password';
                              }
                              if (!isValidPassword(text)) {
                                return ' Enter Valid Password';
                              }
                              if (viewModel.password.text != text) {
                                return "Password Doesn't Match";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormFiled(
                            labelText: 'Phone Number',
                            hintText: 'Phone Number',
                            controller: viewModel.phone,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Enter Phone Number';
                              }

                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                login();
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyles.elevatedButtonWhiteMedium,
                              ),
                            ),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account?',
                            style: TextStyles.font16BlackRegular,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, RoutesName.loginScreen);
                            },
                            child: Text('Login',
                                style: TextStyles.textButtonBaseBlueRegular),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  bool isValidField() {
    bool isValid = false;
    if (viewModel.username.text == '' ||
        viewModel.firstName.text == '' ||
        viewModel.lastName.text == '' ||
        viewModel.email.text == '' ||
        viewModel.password.text == '' ||
        viewModel.rePassword.text == '' ||
        viewModel.phone.text == '') {
      isValid = true;
    }
    return isValid;
  }

  void login() {
    if (!isValidField()) return;

    viewModel.doAction(
        intent: SignUpIntent(
            username: viewModel.username.text,
            firstName: viewModel.firstName.text,
            lastName: viewModel.lastName.text,
            email: viewModel.email.text,
            password: viewModel.password.text,
            rePassword: viewModel.rePassword.text,
            phone: viewModel.phone.text));
  }
}