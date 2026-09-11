import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/core/utils/app_colors.dart';
import 'package:new_e_commerce_app/core/utils/app_styles.dart';

class DialogUtils {
  static void showLoading({ required BuildContext context,required String message}){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:(context) {
        return AlertDialog(
          content:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message,style: AppStyles.medium18PrimaryDark  ,),
              )
            ],),
        );
      }, );
  }
  static void hideLoading({required BuildContext context}){
    Navigator.pop(context);
  }
  static void showMessage({required BuildContext context,
    required  String message,String? title='',
    String? positiveActionName,VoidCallback? positiveAction,
    String? negativeActionName,VoidCallback? negativeAction
  }){
    List<Widget>actions=[];
    if(positiveActionName!=null){
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            positiveAction?.call();
            ///call=>execute the function
          },
          child: Text(positiveActionName,style: AppStyles.medium18PrimaryDark,)));
    }
    if(negativeActionName!=null){
      actions.add(TextButton(
          onPressed:() {
            Navigator.pop(context);
            negativeAction?.call();
          },
          child: Text(negativeActionName,style: AppStyles.medium18PrimaryDark,)));
    }
    showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message,style: AppStyles.medium18PrimaryDark,),
          title: Text(title!,style: AppStyles.medium18PrimaryDark,)  ,
          actions:actions,
        );
      },
    );

  }
}