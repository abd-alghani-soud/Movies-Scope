import 'package:dartz/dartz.dart';
import 'package:movies_scope/features/home/data/data_source/data_home.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';

class RepoHome {
  Future<Either<String, List<MovieModel>>> repoPlayNow() async {
    final result = await DataHome().getMoviePlayingNow();
    try {
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
