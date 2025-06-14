part of 'home_bloc.dart';

class HomeState {
  final Status statusPlayingNow;
  final List<MovieModel> movieModelPlayingNow;
  final Status statusPopular;
  final List<MovieModel> movieModelPopular;

  HomeState({this.statusPlayingNow = Status
      .loading, this.movieModelPlayingNow = const[
  ], this.statusPopular = Status.loading, this.movieModelPopular = const[]});

  HomeState copyWith({
    Status? statusPlayingNow,
    List<MovieModel>? movieModelPlayingNow,
    Status? statusPopular,
    List<MovieModel>? movieModelPopular,
  }) {
    return HomeState(
      statusPlayingNow: statusPlayingNow ?? this.statusPlayingNow,
      movieModelPlayingNow: movieModelPlayingNow ?? this.movieModelPlayingNow,
      statusPopular: statusPopular ?? this.statusPopular,
      movieModelPopular: movieModelPopular ?? this.movieModelPopular,
    );
  }

}
