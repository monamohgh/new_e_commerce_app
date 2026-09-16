import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

 class  CustomTextFormField extends StatefulWidget {
  final double? radius;
  final Color borderColor;
  final bool? filled;
  final Color? fillColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  bool isObscureText;
  final TextEditingController? controller;
   String? Function(String?)?validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  bool isPassword;
  TextStyle? textStyle;
  bool readonly;
  CustomTextFormField({
    super.key,
    required this.isObscureText,
    this.maxLines=1,
    this.borderColor=AppColors.whiteColor,
    this.radius,
    this.filled,
    this.fillColor=AppColors.whiteColor,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType=TextInputType.text,
    this.obscureText =false,
    this.validator,
    this.textStyle,
    this.isPassword=false,
    this.readonly=false
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:12.h,bottom: 20.h),
      child: TextFormField(
        style: widget.textStyle,
        maxLines: widget.maxLines,
        controller:widget.controller ,
        keyboardType:widget.keyboardType ,
        obscureText: widget.obscureText,
         validator: widget.validator,
        readOnly: widget.readonly,
        decoration: InputDecoration(
          enabledBorder: builtDecorationBorder(
              borderColor:widget.borderColor
              ,radius: widget.radius??16),
          focusedBorder:builtDecorationBorder(
              borderColor:widget.borderColor
              ,radius: widget.radius??16) ,
          errorBorder: builtDecorationBorder(
              borderColor:AppColors.redColor
              ,radius: widget.radius??16),
          focusedErrorBorder:builtDecorationBorder(
              borderColor:AppColors.redColor
              ,radius: widget.radius??16) ,
          filled: widget.filled,
          fillColor: widget.fillColor,
          hintText:widget.hintText ,
          hintStyle: widget.hintStyle,
          labelText: widget.labelText,
          labelStyle:widget.labelStyle,
          prefixIcon:widget.prefixIcon ,
          suffixIcon: widget.suffixIcon,
        ),

      ),
    );
  }

  OutlineInputBorder builtDecorationBorder({required double radius,required Color borderColor}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color:borderColor ,
          width: 2,
        )
    );
  }
}
