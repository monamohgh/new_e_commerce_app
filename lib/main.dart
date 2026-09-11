import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/utils/app_routes.dart';
import 'package:new_e_commerce_app/core/utils/app_theme.dart';
import 'package:new_e_commerce_app/features/ui/auth/login/login_screen.dart';
import 'package:new_e_commerce_app/features/ui/auth/register/register_screen.dart';

import 'features/ui/pages/home/home_screen.dart';
import 'features/ui/pages/splash/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashRoute,
          routes: {
            AppRoutes.splashRoute:(context)=>SplashScreen(),
            AppRoutes.homeRoute:(context)=>HomeScreen(),
            AppRoutes.loginRoute:(context)=>LoginScreen(),
            AppRoutes.registerRoute:(context)=>RegisterScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}


