import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomElevatedButton extends StatelessWidget {
  String text;
  TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? radius;

  CustomElevatedButton({super.key,
    this.textStyle,
     required this.text,
    this.onPressed,
    required this.backgroundColor,
    this.radius,
    this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: SizedBox(
        height: 66.h,
        width: 398.w,
        child: Center(
          child: AutoSizeText(text,style: textStyle,),
        ),
      ),
    );
  }
}
