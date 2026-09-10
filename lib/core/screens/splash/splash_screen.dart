import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/core/screens/home/home_screen.dart';
import 'package:new_e_commerce_app/core/utils/app_assets.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>HomeScreen(),
          ),
        );
      }
    });
  }
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
