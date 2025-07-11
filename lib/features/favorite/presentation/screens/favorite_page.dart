import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_scope/constant/my_colors.dart';
import 'package:movies_scope/core/di/di.dart';
import 'package:movies_scope/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:movies_scope/features/favorite/presentation/widgets/favorite_movie_item.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/features/home/presentation/screens/details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_scope/helper/remove_movie_with_undo.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteBloc favoriteBloc;

  @override
  void initState() {
    super.initState();
    favoriteBloc = getIt<FavoriteBloc>();
    favoriteBloc.add(GetAllFavoriteEvent());
  }

  void _openMovieDetails(BuildContext context, MovieModel movie) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                DetailsPage(movie: movie),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(
            begin: Offset(0, 1),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.ease));
          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Your Favorites',
          style: TextStyle(
            color: MyColors.activeColor,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        bloc: favoriteBloc,
        builder: (context, state) {
          if (state.wishlistMovies.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.white.withOpacity(0.4),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No favorite movies yet!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Browse movies and add some ❤️',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: state.wishlistMovies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final movie = state.wishlistMovies[index];
                return FavoriteMovieItem(
                  movie: movie,
                  onTap: () => _openMovieDetails(context, movie),
                  onRemove: () => removeMovieWithUndo(context, movie.id, movie),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
