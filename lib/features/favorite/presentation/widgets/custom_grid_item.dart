import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/features/home/presentation/widgets/movie_card.dart';

class CustomGridItem extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onTap;

  const CustomGridItem({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              offset: Offset(2, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: MovieCard(movie: movie),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.favorite, color: Colors.redAccent, size: 24.sp),
            ),
          ],
        ),
      ),
    );
  }
}
