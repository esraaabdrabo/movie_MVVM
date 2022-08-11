class Response {
 late int page;
   List<movie>? results;
 late int totalPages;
 late int totalResults;

  Response({required this.page,  this.results, required this.totalPages, required this.totalResults});

  Response.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) this.page = json["page"];
    if (json["results"] is List)
      this.results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => movie.fromJson(e)).toList();
    if (json["total_pages"] is int) this.totalPages = json["total_pages"];
    if (json["total_results"] is int) this.totalResults = json["total_results"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["page"] = this.page;
    if (this.results != null)
      data["results"] = this.results!.map((e) => e.toJson()).toList();
    data["total_pages"] = this.totalPages;
    data["total_results"] = this.totalResults;
    return data;
  }
}

class movie {
  bool adult= false;
  String backdropPath='wwemzKWzjKYJFfCeiB57q3r4Bcm.svg';
  List<int> genreIds=[];
 late int id;
  String originalLanguage='';
  String originalTitle='';
  String overview='';
  double popularity=0.0;
  String posterPath='';
  String releaseDate='';
  String title='';
  bool video= false;
  double voteAverage=0.0;
  int voteCount=0;

  movie(
      {adult,
       backdropPath,
      genreIds,
      required this.id,
      originalLanguage,
       originalTitle,
    overview,
       popularity,
       posterPath,
       releaseDate,
       title,
       video,
       voteAverage,
      voteCount});

  movie.fromJson(Map<String, dynamic> json) {
    if (json["adult"] is bool) this.adult = json["adult"];
    if (json["backdrop_path"] is String)
      this.backdropPath = json["backdrop_path"];
    if (json["genre_ids"] is List)
      this.genreIds =
          (json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"]))!;
    if (json["id"] is int) this.id = json["id"];
    if (json["original_language"] is String)
      this.originalLanguage = json["original_language"];
    if (json["original_title"] is String)
      this.originalTitle = json["original_title"];
    if (json["overview"] is String) this.overview = json["overview"];
    if (json["popularity"] is double) this.popularity = json["popularity"];
    if (json["poster_path"] is String) this.posterPath = json["poster_path"];
    if (json["release_date"] is String) this.releaseDate = json["release_date"];
    if (json["title"] is String) this.title = json["title"];
    if (json["video"] is bool) this.video = json["video"];
    if (json["vote_average"] is double) this.voteAverage = json["vote_average"];
    if (json["vote_count"] is int) this.voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["adult"] = this.adult;
    data["backdrop_path"] = this.backdropPath;
    if (this.genreIds != null) data["genre_ids"] = this.genreIds;
    data["id"] = this.id;
    data["original_language"] = this.originalLanguage;
    data["original_title"] = this.originalTitle;
    data["overview"] = this.overview;
    data["popularity"] = this.popularity;
    data["poster_path"] = this.posterPath;
    data["release_date"] = this.releaseDate;
    data["title"] = this.title;
    data["video"] = this.video;
    data["vote_average"] = this.voteAverage;
    data["vote_count"] = this.voteCount;
    return data;
  }
}
