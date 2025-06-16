import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/constant/my_colors.dart';
import 'package:movies_scope/core/di/di.dart';
import 'package:movies_scope/core/enum.dart';
import 'package:movies_scope/features/home/presentation/bloc/home_bloc.dart';
import 'package:movies_scope/features/home/presentation/screens/details_page.dart';
import 'package:movies_scope/features/home/presentation/widgets/custom_carousel.dart';
import 'package:movies_scope/features/home/presentation/widgets/movie_card.dart';

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
    getIt<HomeBloc>().add(GetPopularMovieEvent());
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
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              bloc: getIt<HomeBloc>(),
              builder: (context, state) {
                if (state.statusPlayingNow == Status.loading) {
                  return SizedBox(
                    height: 200.h,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else if (state.statusPlayingNow == Status.success) {
                  return SizedBox(
                    height: 220.h,
                    child: CustomCarousel(movies: state.movieModelPlayingNow),
                  );
                } else if (state.statusPlayingNow == Status.failure) {
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
            SizedBox(height: 10.h),
            BlocBuilder<HomeBloc, HomeState>(
              bloc: getIt<HomeBloc>(),
              builder: (context, state) {
                if (state.statusPopular == Status.loading) {
                  return SizedBox(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state.statusPopular == Status.failure) {
                  return SizedBox(
                    height: 100.h,
                    child: const Center(child: Text('Failed')),
                  );
                } else if (state.statusPopular == Status.success) {
                  return SizedBox(
                    height: 276.h,
                    child: ListView.builder(
                      itemCount: state.movieModelPopular.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final movie = state.movieModelPopular[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: MovieCard(movie: movie),
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
