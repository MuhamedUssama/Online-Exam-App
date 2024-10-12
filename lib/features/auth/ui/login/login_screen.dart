import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';


import '../../../../config/router/routes_name.dart';
import '../../../../config/theme/test_style.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../../core/widgets/custom_form_field.dart';

import 'cubit/login_states.dart';
import 'cubit/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar:AppBar(
          title: Text('Login'),
        ),
        body: BlocListener<LoginViewModel,LoginStates>(
          listenWhen: (previous, current) {

            if(current is LoginLoadingState||current is LoginSuccessState||current is LoginErrorState){
              return true;
            }
            return false;
          },

          listener: (context, state) {
            if (state is LoginLoadingState){
              DialogUtils.showLoading(context, 'LOADING');
            }
            else if (state is LoginErrorState){
              DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, contentMessage: state.errorMessage??"Please Try Again",title: 'SomeThing went Wrong');
            }


              else if (state is LoginSuccessState){
                DialogUtils.hideLoading(context);
                print(state.user?.email);
                DialogUtils.showMessage(context, contentMessage: 'User Logged In Successfully',title: 'Success');
              }



          },
          child: Form(
          key: formKey,
            child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFormFiled(
                        hintText: 'Enter Your E-Mail',
                        controller:email ,
                        validator: (text){
                          if(text == null||text.trim().isEmpty){
                            return 'Please Enter E-Mail';
                          }
                          if(!isValidEmail(text)){
                            return 'Please Enter Valid Email';
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
                        hintText: 'Enter Your Password',
                        controller:password ,
                        secureText: true,
                        validator: (text){
                          if(text == null||text.trim().isEmpty){
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


              BlocBuilder<LoginViewModel,LoginStates>(
                  builder:(context, state) {

                    return
                      Column(
                        children: [
                          Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(onPressed: (){
                                        login();
                                      }, child: Text('Login',style:TextStyles.elevatedButtonWhiteMedium ,),),
                                    )),
                              ],
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?",style: TextStyles.font16BlackRegular,),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushReplacementNamed(context, RoutesName.signUpScreen);
                                }, child: Text('Sign Up',style:TextStyles.textButtonBaseBlueRegular),),
                            ],
                          ),
                        ],
                      );

                  },

              )

            ],
                    ),
          ),

            )


      ),
    );
  }

  bool isValidForm(){
    bool isValid = true;
    if (formKey.currentState?.validate() == false){
      isValid = true;
    }
    return isValid;

  }  bool isValidField(){
    bool isValid = true;
    if (
        email.text == ''||
        password.text == ''
       ){
      isValid = false;
    }
    return isValid;
  }

  void login (){
    if(!isValidForm())return;
    if(!isValidField())return;

    viewModel.doAction(intent:LoginIntent(email.text, password.text));



  }
}
