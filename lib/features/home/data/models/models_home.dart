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
      'release_date': releaseDate,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
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
      releaseDate: map['release_date'] as String? ?? '',
      posterPath: map['poster_path'] as String? ?? '',
      backdropPath: map['backdrop_path'] as String? ?? '',
      voteAverage: (map['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: map['vote_count'] as int? ?? 0,
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      adult: map['adult'] as bool? ?? false,
      originalLanguage: map['original_language'] as String? ?? '',
      originalTitle: map['original_title'] as String? ?? '',
      video: map['video'] as bool? ?? false,
      popularity: (map['popularity'] as num?)?.toDouble() ?? 0.0,
    );
  }

}
