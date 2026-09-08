import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/core/utils/app_assets.dart';
import 'package:new_e_commerce_app/core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image(image: AssetImage(AppAssets.splashBackground),fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
          Image(image: AssetImage(AppAssets.splashImage))
        ],
      )
    );
  }
}
