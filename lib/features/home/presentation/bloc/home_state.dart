part of 'home_bloc.dart';

class HomeState {
  final Status status;
  final List<MovieModel> movieModel;

  HomeState({this.status = Status.loading, this.movieModel = const []});

  HomeState copyWith({
    Status? status,
    List<MovieModel>? movieModel,
  }) {
    return HomeState(
      status: status ?? this.status,
      movieModel: movieModel ?? this.movieModel,
    );
  }
}
