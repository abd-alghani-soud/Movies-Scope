part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetPlayingNowMovieEvent extends HomeEvent {}
class GetPopularMovieEvent extends HomeEvent {}