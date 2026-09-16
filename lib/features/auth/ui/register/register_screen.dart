import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/utils/app_assets.dart';
import 'package:new_e_commerce_app/core/utils/app_colors.dart';
import 'package:new_e_commerce_app/core/utils/app_routes.dart';
import 'package:new_e_commerce_app/core/utils/app_styles.dart';

import '../../../../core/utils/validators.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController fullNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController mobileNumberController=TextEditingController();

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
                    bottom:50.h,
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
                        Text('Full Name',style: AppStyles.medium18White,),
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
                        Text('Mobile Number',style: AppStyles.medium18White,),
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
                        Text('E-mail address',style: AppStyles.medium18White,),
                        SizedBox(height: 10.h,),
                        CustomTextFormField(
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          isObscureText: false,
                          hintText: 'enter your name',
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
                        SizedBox(height: 40.h,),
                        CustomElevatedButton(text: 'Sign up',textStyle: AppStyles.semi20Primary, backgroundColor: AppColors.whiteColor,
                          onPressed: (){
                            //todo:go to home
                            Navigator.pushNamed(context, AppRoutes.homeRoute);
                          },),

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
