import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
import 'package:movies_scope/features/search/data/data_source/search_data_source.dart';
@injectable
class SearchRepo {
  final SearchDataSource searchDataSource;

  SearchRepo({required this.searchDataSource});

  Future<Either<String, List<MovieModel>>> getMovieFromSearch(String movie) async {
    final result = await searchDataSource.getMovieFromSearch(movie);
    try {
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
