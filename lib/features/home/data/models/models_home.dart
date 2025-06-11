class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;
  final bool adult;
  final String originalLanguage;
  final String originalTitle;
  final bool video;
  final double popularity;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.adult,
    required this.originalLanguage,
    required this.originalTitle,
    required this.video,
    required this.popularity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'releaseDate': releaseDate,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'genreIds': genreIds,
      'adult': adult,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'video': video,
      'popularity': popularity,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int? ?? 0,
      title: map['title'] as String? ?? '',
      overview: map['overview'] as String? ?? '',
      releaseDate: map['releaseDate'] as String? ?? '',
      posterPath: map['posterPath'] as String? ?? '',
      backdropPath: map['backdropPath'] as String? ?? '',
      voteAverage: (map['voteAverage'] as num?)?.toDouble() ?? 0.0,
      voteCount: map['voteCount'] as int? ?? 0,
      genreIds: List<int>.from(map['genreIds'] ?? []),
      adult: map['adult'] as bool? ?? false,
      originalLanguage: map['originalLanguage'] as String? ?? '',
      originalTitle: map['originalTitle'] as String? ?? '',
      video: map['video'] as bool? ?? false,
      popularity: (map['popularity'] as num?)?.toDouble() ?? 0.0,
    );
  }

}
