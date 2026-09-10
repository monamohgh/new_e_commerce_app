import 'package:flutter/material.dart';
import 'package:new_e_commerce_app/core/utils/app_routes.dart';
import 'package:new_e_commerce_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRoute,
      routes: {
      AppRoutes.splashRoute:(context)=>SplashScreen(),
      },
    );
  }
}


