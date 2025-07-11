part of 'favorite_bloc.dart';

enum Status { initial, loading, success, failure }

class FavoriteState {
  final Status wishlistStatus;
  final List<MovieModel> wishlistMovies;

  FavoriteState({
    this.wishlistStatus = Status.initial,
    this.wishlistMovies = const [],
  });

  FavoriteState copyWith({
    Status? wishlistStatus,
    List<MovieModel>? wishlistMovies,
  }) {
    return FavoriteState(
      wishlistStatus: wishlistStatus ?? this.wishlistStatus,
      wishlistMovies: wishlistMovies ?? this.wishlistMovies,
    );
  }
}
