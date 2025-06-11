import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/core/di/di.dart';
import 'package:movies_scope/core/enum.dart';
import 'package:movies_scope/features/constant/my_colors.dart';
import 'package:movies_scope/features/home/presentation/bloc/home_bloc.dart';
import 'package:movies_scope/features/home/presentation/widgets/custom_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getIt<HomeBloc>().add(GetPlayingNowMovieEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Movie App',
          style: TextStyle(color: MyColors.activeColor, fontSize: 20.sp),
        ),
        backgroundColor: MyColors.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              bloc: getIt<HomeBloc>(),
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return SizedBox(
                    height: 200.h,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else if (state.status == Status.success) {
                  return SizedBox(
                    height: 220.h,
                    child: CustomCarousel(movies: state.movieModel),
                  );
                } else if (state.status == Status.failure) {
                  return SizedBox(
                    height: 200.h,
                    child: Center(
                      child: Text(
                        'Failed to load movie',
                        style: TextStyle(color: MyColors.activeColor),
                      ),
                    ),
                  );
                }
                return SizedBox(height: 200.h);
              },
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most Popular',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: MyColors.activeColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
