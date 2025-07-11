import 'package:flutter/material.dart';
import 'package:movies_scope/core/di/di.dart';
import 'package:movies_scope/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';

void removeMovieWithUndo(BuildContext context, int movieId, MovieModel movie) {
  getIt<FavoriteBloc>().add(RemoveToFavoriteEvent(id: movieId));
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Removed from favorites'),
      backgroundColor: Colors.redAccent,
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.white,
        onPressed: () {
          getIt<FavoriteBloc>().add(AddToFavoriteEvent(movie: movie));
        },
      ),
      duration: Duration(seconds: 3),
    ),
  );
}
