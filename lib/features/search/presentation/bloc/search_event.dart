part of 'search_bloc.dart';

class SearchEvent {}
class GetMovieFromSearchEvent extends SearchEvent{
  final String movie ;

  GetMovieFromSearchEvent({required this.movie});

}
