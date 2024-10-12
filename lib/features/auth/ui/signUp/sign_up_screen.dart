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
  TextEditingController username = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phone = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var viewModel = getIt<SignUpViewModel>();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
          appBar:AppBar(
            title: Text('Login'),
          ),
          body: BlocListener<SignUpViewModel,SignUpStates>(
            listenWhen: (previous, current) {

              if(current is SignUpLoadingState||current is SignUpSuccessState||current is SignUpErrorState){
                return true;
              }
              return false;
            },

            listener: (context, state) {
              if (state is SignUpLoadingState){
                DialogUtils.showLoading(context, 'LOADING');
              }
              else if (state is SignUpErrorState){
                DialogUtils.hideLoading(context);
                DialogUtils.showMessage(context, contentMessage: state.errorMessage??"Please Try Again",title: 'Something went Wrong');
              }


              else if (state is SignUpSuccessState){
                DialogUtils.hideLoading(context);
                print(state.user?.email);
                DialogUtils.showMessage(context, contentMessage: 'User Logged In Successfully',title: 'Success');
              }



            },
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomFormFiled(
                              hintText: 'Enter Username',
                              controller:username ,
                              validator: (text){
                                if(text == null||text.trim().isEmpty){
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
                              hintText: 'Enter First Name',
                              controller:firstName ,
                              validator: (text){
                                if(text == null||text.trim().isEmpty){
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
                              hintText: 'Enter Last Name',
                              controller:lastName ,
                              validator: (text){
                                if(text == null||text.trim().isEmpty){
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
                              hintText: 'Enter Your E-Mail',
                              controller:email ,
                              validator: (text){
                                if(text == null||text.trim().isEmpty){
                                  return ' Enter E-Mail';
                                }
                                if(!isValidEmail(text)){
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
                              hintText: 'Password',
                              controller:password ,
                              secureText: true,
                              validator: (text){
                                if(text == null||text.trim().isEmpty){
                                  return 'Enter Password';
                                }
                                if(!isValidPassword(text)){
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
                              hintText: 'Confirm Password',
                              controller:rePassword ,
                              secureText: true,
                              validator: (text){
                                if(text == null||text.trim().isEmpty){
                                  return 'Enter Confirm Password';
                                }
                                if(!isValidPassword(text)){
                                  return ' Enter Valid Password';
                                }
                                if (password.text != text){
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
                              hintText: 'Phone Number',
                              controller:phone ,
                              validator: (text){
                                if(text == null||text.trim().isEmpty){
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

                    BlocBuilder<SignUpViewModel,SignUpStates>(
                      builder:(context, state) {

                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(onPressed: (){
                                        login();
                                      }, child: Text('Sign Up',style:TextStyles.elevatedButtonWhiteMedium ,),),
                                    )),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an Account?',style: TextStyles.font16BlackRegular,),
                                TextButton(
                                    onPressed: (){
                                  Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
                                }, child: Text('Login',style:TextStyles.textButtonBaseBlueRegular),),
                              ],
                            )
                          ],
                        );


                      },

                    )

                  ],
                ),
              ),
            ),

          )


      ),
    );
  }
  bool isValidForm(){
    bool isValid = true;
    if (formKey.currentState?.validate() == false){
      isValid = false;
    }

    return isValid;

  }
  bool isValidField(){
    bool isValid = true;
    if (username.text == ''||
        firstName.text == ''||
        lastName.text == ''||
        email.text == ''||
        password.text == ''||
        rePassword.text ==''||
        phone.text == ''){
      isValid = true;
    }
    return isValid;
  }
  void login (){
    if(!isValidForm())return;
    if(!isValidField())return;
    setState(() {

    });

    viewModel.doAction(intent:SignUpIntent(
        username: username.text,
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        password: password.text,
        rePassword: rePassword.text
        , phone: phone.text));



  }
}
