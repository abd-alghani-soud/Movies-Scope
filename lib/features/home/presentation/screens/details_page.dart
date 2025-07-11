import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/constant/my_colors.dart';
import 'package:movies_scope/core/di/di.dart';
import 'package:movies_scope/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/features/home/presentation/widgets/info_icon.dart';

class DetailsPage extends StatelessWidget {
  final MovieModel movie;

  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100.h),
                // Poster
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: 250.w,
                      height: 350.h,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.broken_image,
                            size: 100,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoIcon(
                      icon: Icons.calendar_today,
                      text: movie.releaseDate.split('-')[0],
                    ),
                    SizedBox(width: 24.w),
                    Icon(Icons.star, color: Colors.orangeAccent),
                    SizedBox(width: 4.w),
                    Text(
                      '${movie.voteAverage}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Story Line',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          movie.overview,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 38.h,
            left: 16.w,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),

          Positioned(
            top: 38.h,
            right: 16.w,
            child: BlocBuilder<FavoriteBloc, FavoriteState>(
              bloc: getIt<FavoriteBloc>(),
              builder: (context, state) {
                final isFav = state.wishlistMovies.any((m) => m.id == movie.id);
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      if (isFav) {
                        getIt<FavoriteBloc>().add(
                          RemoveToFavoriteEvent(id: movie.id),
                        );
                      } else {
                        getIt<FavoriteBloc>().add(
                          AddToFavoriteEvent(movie: movie),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
