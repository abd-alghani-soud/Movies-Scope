import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_scope/core/enum.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/features/home/data/repository/repo_home.dart';

part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RepoHome repo;

  HomeBloc(this.repo) : super(HomeState()) {
    on<GetPlayingNowMovieEvent>((event, emit) async {
      emit(state.copyWith(statusPlayingNow: Status.loading));
      print('load load 1');
      final result = await repo.repoPlayNow();
      result.fold(
        (l) {
          print('$l lllllllll');
          emit(state.copyWith(statusPlayingNow: Status.failure));
        },
        (r) {
          print('$r rrrrrrrrr');
          emit(state.copyWith(
              statusPlayingNow: Status.success, movieModelPlayingNow: r));
        },
      );
    });
    on<GetPopularMovieEvent>((event, emit) async {
      emit(state.copyWith(statusPopular: Status.loading));
      print('load load 2');
      final result = await repo.repoPopular();
      result.fold(
            (l) {
          print('$l lllllllll2');
          emit(state.copyWith(statusPopular: Status.failure));
        },
            (r) {
          print('$r rrrrrrrrr2');
          emit(state.copyWith(
              statusPopular: Status.success, movieModelPopular: r));
        },
      );
    });
  }
}
