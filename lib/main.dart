import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/di/di.dart';
import 'package:new_e_commerce_app/core/utils/app_routes.dart';
import 'package:new_e_commerce_app/core/utils/app_theme.dart';
import 'package:new_e_commerce_app/core/utils/my_bloc_observer.dart';
import 'package:new_e_commerce_app/features/pages/home_screen/home_screen.dart';

import 'features/auth/ui/login/login_screen.dart';
import 'features/auth/ui/register/register_screen.dart';
import 'features/pages/splash_screen/splash_screen.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
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
//todo:view=>Object ViewModel(Cubit)
//todo:ViewModel=>Object UseCase
//todo:UseCase=>Object Repository
//todo:Repository=>Object Remote Data Source
//todo:Repository=>Object Connectivity
//todo:Remote Data Source=>Object ApiClient
//todo:ApiClient=>Object Dio
// todo:Dio=>BaseOptions,PrettyDioLogger(),Interceptors

