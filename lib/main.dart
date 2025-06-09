import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/features/splash_onboarding/presentation/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}