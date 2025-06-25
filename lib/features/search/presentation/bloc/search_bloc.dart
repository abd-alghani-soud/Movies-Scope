import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_scope/core/enum.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/features/search/data/repository/search_repo.dart';

part 'search_event.dart';

part 'search_state.dart';

@lazySingleton
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo repo;

  SearchBloc(this.repo) : super(SearchState()) {
    on<GetMovieFromSearchEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      print('load search');
      final result = await repo.getMovieFromSearch(event.movie);
      result.fold(
        (l) {
          emit(state.copyWith(status: Status.failure));
        },
        (r) {
          emit(state.copyWith(status: Status.success, movieModelSearch: r));
        },
      );
    });
  }
}
