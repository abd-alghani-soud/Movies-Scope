import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

@lazySingleton
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState()) {
    on<FavoriteEvent>((event, emit) {});
    on<GetAllFavoriteEvent>((event, emit) {
      emit(
        state.copyWith(
          wishlistMovies: Hive.box<MovieModel>('wishlist').values.toList(),
        ),
      );
    });
    on<AddToFavoriteEvent>((event, emit) async {
      await Hive.box<MovieModel>('wishlist').put(event.movie.id, event.movie);
      add(GetAllFavoriteEvent());
    });
    on<RemoveToFavoriteEvent>((event, emit) async {
      await Hive.box<MovieModel>('wishlist').delete(event.id);
      add(GetAllFavoriteEvent());
    });
  }
}
