import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/features/constant/my_colors.dart';
import 'package:movies_scope/features/constant/my_string.dart';
import 'package:movies_scope/features/splash_onboarding/presentation/screens/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isFading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      setState(() {
        isFading = false;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFading
                ? Image.asset(
                      'assets/images/splash.png',
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.contain,
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .fade(duration: 1.seconds)
                : Image.asset(
                  'assets/images/splash.png',
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.contain,
                ),
            SizedBox(height: 20.h),
            isFading
                ? Text(
                      MyString.appName,
                      style: TextStyle(
                        color: MyColors.activeColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .fade(duration: 1.seconds)
                : Text(
                  MyString.appName,
                  style: TextStyle(
                    color: MyColors.activeColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
