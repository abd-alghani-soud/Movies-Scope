import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_scope/core/enum.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/features/home/data/repository/repo_home.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RepoHome repo;

  HomeBloc(this.repo) : super(HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<GetPlayingNowMovieEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      final result = await repo.repoPlayNow();
      result.fold(
        (l) {
          emit(state.copyWith(status: Status.failure));
        },
        (r) {
          emit(state.copyWith(status: Status.success, movieModel: r));
        },
      );
    });
  }
}
