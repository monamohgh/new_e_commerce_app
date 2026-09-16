import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/utils/app_assets.dart';
import 'package:new_e_commerce_app/core/utils/app_colors.dart';
import 'package:new_e_commerce_app/core/utils/app_routes.dart';
import 'package:new_e_commerce_app/core/utils/app_styles.dart';

import '../../../../core/utils/validators.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child:SingleChildScrollView(
              child: Column(
                children: [
               Padding(padding:EdgeInsetsGeometry.only(
                 top: 91.h,
                 bottom:87.h,
                   left: 97.w,
                   right: 97.w
               ),
                 child: Image(image: AssetImage(AppAssets.routeLogo)),
               ),
                  Form(
                    key:formKey ,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AutoSizeText('Welcome Back To Route',style: AppStyles.semi24White,maxLines: 1,),
                          SizedBox(height: 10.h,),
                          AutoSizeText('Please sign in with your mail',style: AppStyles.light16White,),
                          SizedBox(height: 20.h,),
                          Text('Email',style: AppStyles.medium18White,),
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
                          Text('Password',style: AppStyles.medium18White,),
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
                          Text('Forget Password',style: AppStyles.regular18White,textDirection:TextDirection.rtl ,),
                          SizedBox(height: 40.h,),
                          CustomElevatedButton(text: 'Login',textStyle: AppStyles.semi20Primary, backgroundColor: AppColors.whiteColor,
                            onPressed: (){
                            //todo:go to home
                              Navigator.pushNamed(context, AppRoutes.homeRoute);
                            },),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text('Don’t have an account?',style: AppStyles.medium14White,),
                            TextButton( onPressed: () { 
                              //todo:go to sign in
                              Navigator.pushNamed(context, AppRoutes.registerRoute);
                            }, child: Text('Create Account',style: AppStyles.medium14White,),)
                          ],)


                        ],
                      ),
                    ),
                  )
                ],
              ),
          )
      ),
    );
  }
}
