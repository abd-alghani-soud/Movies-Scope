import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_scope/features/home/data/data_source/data_home.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';

@injectable
class RepoHome {
  final DataHome data;

  RepoHome({required this.data});
  Future<Either<String, List<MovieModel>>> repoPlayNow() async {
    final result = await data.getMoviePlayingNow();
    try {
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
