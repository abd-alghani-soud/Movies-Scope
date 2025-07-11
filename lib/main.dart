import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_scope/core/di/di.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/features/splash_onboarding/presentation/screens/splash_page.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(MovieModelAdapter());

  await Hive.openBox<MovieModel>('wishlist');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()),
    );
  }
}
