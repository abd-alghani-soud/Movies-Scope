import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/features/constant/my_colors.dart';
import 'package:movies_scope/features/constant/my_images.dart';
import 'package:movies_scope/features/constant/my_string.dart';
import 'package:movies_scope/features/home/presentation/screens/first_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  final List<Map<String, String>> pages = [
    {
      "title": MyString.title1,
      "subtitle": MyString.subTitle1,
      "image": MyImages.p1,
    },
    {
      "title": MyString.title2,
      "subtitle": MyString.subTitle2,
      "image": MyImages.p2,
    },
    {
      "title": MyString.title3,
      "subtitle": MyString.subTitle3,
      "image": MyImages.p3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15131F),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) => _currentIndex.value = index,
            itemBuilder: (context, index) {
              final page = pages[index];
              return Padding(
                padding: EdgeInsets.all(8.sp),
                child:
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        page['image']!,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ).animate().fade(),
              );
            },
          ),
          Positioned(
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.all(14.sp),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: const Color(0xff171725),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ValueListenableBuilder<int>(
                valueListenable: _currentIndex,
                builder: (context, index, _) {
                  final page = pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        page['title']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().slideX(),
                      Text(
                        page['subtitle']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15.sp,
                        ),
                      ).animate().slideX(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 55.w),
                          SmoothPageIndicator(
                            controller: _controller,
                            count: pages.length,
                            effect: ExpandingDotsEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              spacing: 12,
                              activeDotColor: MyColors.activeColor,
                              dotColor: MyColors.unActiveColor.withOpacity(.5),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (index < pages.length - 1) {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FirstPage(),
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.activeColor,
                              fixedSize: Size(70.w, 70.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: Icon(
                              size: 22.sp,
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
