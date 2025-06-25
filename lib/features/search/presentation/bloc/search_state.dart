part of 'search_bloc.dart';

class SearchState {
  final Status? status;
  final List<MovieModel> movieModelSearch;

  SearchState({this.status = Status.init, this.movieModelSearch = const []});

  SearchState copyWith({
    Status? status,
    List<MovieModel>? movieModelSearch,
  }) {
    return SearchState(
      status: status ?? this.status,
      movieModelSearch: movieModelSearch ?? this.movieModelSearch,
    );
  }
}
