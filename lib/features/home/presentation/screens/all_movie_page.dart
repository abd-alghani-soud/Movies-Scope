import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_scope/constant/my_colors.dart';
import 'package:movies_scope/core/di/di.dart';
import 'package:movies_scope/core/enum.dart';
import 'package:movies_scope/features/home/presentation/bloc/home_bloc.dart';
import 'package:movies_scope/features/home/presentation/widgets/movie_card.dart';

class AllMoviePage extends StatefulWidget {
  const AllMoviePage({super.key});

  @override
  State<AllMoviePage> createState() => _AllMoviePage();
}

class _AllMoviePage extends State<AllMoviePage> {
  @override
  void initState() {
    super.initState();

    getIt<HomeBloc>().add(GetPopularMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.activeColor),
        title: Text(
          'All Movie',
          style: TextStyle(color: MyColors.activeColor, fontSize: 20.sp),
        ),
        backgroundColor: MyColors.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Expanded(
              // ← أضف هذا
              child: BlocBuilder<HomeBloc, HomeState>(
                bloc: getIt<HomeBloc>(),
                builder: (context, state) {
                  if (state.statusPopular == Status.loading) {
                    return Center(
                      child: SpinKitFadingCircle(
                        color: MyColors.activeColor,
                        size: 50.0,
                      ),
                    );
                  } else if (state.statusPopular == Status.failure) {
                    return const Center(child: Text('Failed'));
                  } else if (state.statusPopular == Status.success) {
                    return GridView.builder(
                      itemCount: state.movieModelPopular.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final movie = state.movieModelPopular[index];
                        return MovieCard(movie: movie); // ← أزل Padding هنا
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
