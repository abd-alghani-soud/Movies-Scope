import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/features/constant/my_colors.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';

class CustomCarousel extends StatefulWidget {
  final List<MovieModel> movies;

  const CustomCarousel({required this.movies, super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.movies.length,
          options: CarouselOptions(
            height: 200.h,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIdx) {
            final movie = widget.movies[index];
            final backdropUrl =
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}';

            return ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    backdropUrl,
                    fit: BoxFit.fill,
                    errorBuilder:
                        (context, __, ___) =>
                            const Center(child: Icon(Icons.broken_image)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    bottom: 16.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.movies.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: _currentIndex == index ? 8.w : 6.w,
              height: _currentIndex == index ? 8.h : 6.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == index
                        ? MyColors.activeColor
                        : Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
