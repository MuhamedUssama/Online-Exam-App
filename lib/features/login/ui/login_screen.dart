import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/theme/app_colors.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/features/login/ui/cubit/login_states.dart';

import '../../../config/theme/test_style.dart';
import '../../../core/di/di.dart';
import '../../../core/utils/validation_utils.dart';
import '../../../core/widgets/custom_form_field.dart';
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
            if (previous is LoginSuccessState){
              Navigator.pop(context);
            }
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
            DialogUtils.showMessage(context, contentMessage: state.errorMessage??'error');
            }


              else if (state is LoginSuccessState){
                DialogUtils.hideLoading(context);
                print(state.user?.email);
                if (state.user?.email   == null){
                  DialogUtils.showMessage(context, contentMessage: "error");
                }else{
                DialogUtils.showMessage(context, contentMessage: 'good');
              }}



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

                    return Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(onPressed: (){
                                    login();
                                  }, child: Text('Login',style:TextStyles.elevatedButtonWhiteMedium ,),),
                                )),
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

  }

  void login (){
    if(!isValidForm())return;

    viewModel.doAction(intent:LoginIntent('yousef.gamal677@gmail.com', 'Yousef@123'));



  }
}
