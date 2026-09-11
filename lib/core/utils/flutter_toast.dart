import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static Future<bool?> showToastMessage(
     String msg, Color backgroundColor, Color textColor
  ){
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 20
    );
  }
}