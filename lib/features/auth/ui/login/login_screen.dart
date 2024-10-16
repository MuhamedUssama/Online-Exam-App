import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';

import '../../../../config/router/routes_name.dart';
import '../../../../config/theme/test_style.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/custom_form_field.dart';

import 'cubit/login_states.dart';
import 'cubit/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  void dispose() {
    viewModel.email.dispose();
    viewModel.password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: BlocListener<LoginViewModel, LoginStates>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is LoginLoadingState) {
              DialogUtils.showLoading(context, 'Loading.');
            } else if (state is LoginErrorState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                  contentMessage: state.errorMessage ?? "Please Try Again",
                  title: 'Error',
                  posActionName: 'Ok');
            } else if (state is LoginSuccessState) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(context,
                  contentMessage: 'User Logged In Successfully',
                  title: 'Success',
                  posActionName: 'Ok');
            }
          },
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomFormFiled(
                          labelText: 'Enter E-mail',
                          hintText: 'Enter Your E-Mail',
                          controller: viewModel.email,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter E-Mail';
                            }
                            if (!isValidEmail(text)) {
                              return 'Please Enter Valid Email';
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
                          hintText: 'Enter Password',
                          controller: viewModel.password,
                          secureText: true,
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
                              return 'Please Enter Password';
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
                              'Login',
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
                          "Don't have an account?",
                          style: TextStyles.font16BlackRegular,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RoutesName.signUpScreen);
                          },
                          child: Text('Sign Up',
                              style: TextStyles.textButtonBaseBlueRegular),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  bool isValidField() {
    bool isValid = true;
    if (viewModel.password.text == '' || viewModel.password.text == '') {
      isValid = true;
    }
    return isValid;
  }

  void login() {
    if (!isValidField()) return;

    viewModel.doAction(
        intent: LoginIntent(viewModel.email.text, viewModel.password.text));
  }
}
