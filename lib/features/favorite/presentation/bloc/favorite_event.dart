part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class AddToFavoriteEvent extends FavoriteEvent {
  final MovieModel movie;

  AddToFavoriteEvent({required this.movie});
}

class RemoveToFavoriteEvent extends FavoriteEvent {
  final int id;

  RemoveToFavoriteEvent({required this.id});
}

class GetAllFavoriteEvent extends FavoriteEvent {}
