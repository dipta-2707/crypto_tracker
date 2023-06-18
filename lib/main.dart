import 'package:crypto_tracker/config/route_config.dart';
import 'package:crypto_tracker/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430.0, 932.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Crypto Tracker',
          debugShowCheckedModeBanner: false,
          theme: AppThemeConfig.mainTheme,
          initialRoute: AppRouteConfig.homePagePath,
          getPages: AppRouteConfig.pages,
        );
      },
    );
  }
}
