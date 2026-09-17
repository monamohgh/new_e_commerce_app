import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/di/di.dart';
import 'package:new_e_commerce_app/core/utils/app_assets.dart';
import 'package:new_e_commerce_app/core/utils/app_colors.dart';
import 'package:new_e_commerce_app/core/utils/app_routes.dart';
import 'package:new_e_commerce_app/core/utils/app_styles.dart';
import 'package:new_e_commerce_app/core/utils/flutter_toast.dart';
import 'package:new_e_commerce_app/features/auth/ui/register/cubit/register_cubit.dart';
import 'package:new_e_commerce_app/features/auth/ui/register/cubit/register_states.dart';

import '../../../../core/utils/validators.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController(text: "monaelgherbawi@gmail.com");
  TextEditingController fullNameController = TextEditingController(text: 'Mona Elgherbawi');
  TextEditingController passwordController = TextEditingController(text: 'Mona@123');
  TextEditingController rePasswordController = TextEditingController(text: 'Mona@123');
  TextEditingController mobileNumberController = TextEditingController(text: '01010700701');

  var formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;
  bool _rePasswordVisible =true;
  RegisterCubit cubit = getIt();

  @override
  void initState() {
    _passwordVisible = false;
    _rePasswordVisible=false;

  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterStates>(
        bloc: cubit,
        listener:  (context, state) {
          if(state.registerState.isSuccess){
            ToastMessage.showToastMessage('Register Successfully',
                AppColors.greenColor,
                AppColors.whiteColor);
            Navigator.pushNamed(context, AppRoutes.homeRoute);
          }else if(state.registerState.isError){
            ToastMessage.showToastMessage(state.registerState.errorMessage??'',
                AppColors.redColor,
                AppColors.whiteColor);
          }
        },
    child:  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsetsGeometry.only(
                    top: 91.h,
                    bottom: 50.h,
                    left: 97.w,
                    right: 97.w
                ),
                  child: Image(image: AssetImage(AppAssets.routeLogo)),
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Full Name', style: AppStyles.medium18White,),
                        SizedBox(height: 10.h,),
                        CustomTextFormField(
                          isPassword: false,
                          keyboardType: TextInputType.name,
                          isObscureText: false,
                          hintText: 'enter your full name',
                          hintStyle: AppStyles.light18Hint,
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          controller: fullNameController,
                          validator: AppValidators.validateFullName,
                        ),
                        Text('Mobile Number', style: AppStyles.medium18White,),
                        SizedBox(height: 10.h,),
                        CustomTextFormField(
                          isPassword: false,
                          keyboardType: TextInputType.number,
                          isObscureText: false,
                          hintText: 'enter your mobile no.',
                          hintStyle: AppStyles.light18Hint,
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          controller: mobileNumberController,
                          validator: AppValidators.validatePhoneNumber,
                        ),
                        Text('E-mail address', style: AppStyles.medium18White,),
                        SizedBox(height: 10.h,),
                        CustomTextFormField(
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          isObscureText: false,
                          hintText: 'enter your email',
                          hintStyle: AppStyles.light18Hint,
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          controller: emailController,
                          validator: AppValidators.validateEmail,
                        ),
                        Text('Password', style: AppStyles.medium18White,),
                        SizedBox(height: 10.h,),
                        CustomTextFormField(
                          obscureText: !_passwordVisible,
                          isPassword: true,
                          keyboardType: TextInputType.text,
                          isObscureText: true,
                          hintText: 'enter your password',
                          hintStyle: AppStyles.light18Hint,
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          controller: passwordController,
                          validator: AppValidators.validatePassword,
                          suffixIcon: IconButton(
                            color: AppColors.lightBlack,
                            icon: Icon(

                              /// Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                /// Update the state i.e. toggle the state of passwordVisible variable
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text('RePassword', style: AppStyles.medium18White,),
                        CustomTextFormField(
                          obscureText: !_passwordVisible,
                          isPassword: true,
                          keyboardType: TextInputType.text,
                          isObscureText: true,
                          hintText: 'enter your password',
                          hintStyle: AppStyles.light18Hint,
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          controller: rePasswordController,
                          validator: (val)=>AppValidators.validateConfirmPassword(val, passwordController.text),
                          suffixIcon: IconButton(
                            color: AppColors.lightBlack,
                            icon: Icon(
                              /// Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                /// Update the state i.e. toggle the state of passwordVisible variable
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),

                        BlocBuilder<RegisterCubit,RegisterStates>(
                          bloc: cubit,
                          builder: (context, state) {
                            //todo: state=>initial ,success,error
                            if(!state.registerState.isLoading){
                              return CustomElevatedButton(text: 'Sign up',textStyle: AppStyles.semi20Primary, backgroundColor: AppColors.whiteColor,
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    cubit.register(emailController.text, passwordController.text, mobileNumberController.text, rePasswordController.text, fullNameController.text);
                                  }
                                },);
                            }else{
                              //todo:state=>loading
                              return Center(child: CircularProgressIndicator(
                                backgroundColor: AppColors.whiteColor,
                              ),);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',style: AppStyles.medium14White,),
                            TextButton( onPressed: () {
                              //todo:go to login in
                              Navigator.pushNamed(context, AppRoutes.loginRoute);
                            }, child: Text('login',style: AppStyles.medium14White,),)
                          ],)


                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    ));
  }
}
