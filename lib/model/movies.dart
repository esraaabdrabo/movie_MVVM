import 'package:equatable/equatable.dart';
import 'package:mov/model/enums/language_code.dart';

class Movies {
  // this is pagenation object for movies list so we need to add pagination in UI (refactor).
  final int page;
  final List<Movie>? results;
  final int totalPages;
  final int totalResults;

  const Movies({
    required this.page,
    this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      page: json["page"],
      results:
          (json["results"] as List?)?.map((e) => Movie.fromJson(e)).toList(),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }
}

class Movie extends Equatable {
  final bool adult;
  final String backdropPath;
  final List<int>? genreIds;
  final int id;
  final LanguageCode originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json["adult"],
      backdropPath: json["backdrop_path"] ?? 'wwemzKWzjKYJFfCeiB57q3r4Bcm.svg',
      genreIds:
          json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]),
      id: json["id"],
      originalLanguage: LanguageCodeExtension.fromString(
        json["original_language"],
      ),
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["genre_ids"] = genreIds;
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genreIds,
    id,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
  ];
}
