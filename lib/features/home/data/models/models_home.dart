class MovieModel {
  final Dates dates;
  final int page;
  final List<Movie> results;

  MovieModel({
    required this.dates,
    required this.page,
    required this.results,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      dates: Dates.fromJson(json['dates']),
      page: json['page'],
      results:
      List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': dates.toJson(),
      'page': page,
      'results': results.map((x) => x.toJson()).toList(),
    };
  }
}

class Dates {
  final String maximum;
  final String minimum;

  Dates({required this.maximum, required this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}

class Movie {
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

  Movie({
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      genreIds: List<int>.from(json['genre_ids']),
      adult: json['adult'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      video: json['video'],
      popularity: (json['popularity'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genre_ids': genreIds,
      'adult': adult,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'video': video,
      'popularity': popularity,
    };
  }
}
