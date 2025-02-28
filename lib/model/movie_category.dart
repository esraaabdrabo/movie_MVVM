class MoviesCategories {
  // no need for creating object for just holding a list of categories (refactor);
  final List<MovieCategory>? data;

  const MoviesCategories({this.data});

  factory MoviesCategories.fromJson(Map<String, dynamic> json) {
    return MoviesCategories(
      data:
          (json["genres"] as List?)
              ?.map((e) => MovieCategory.fromJson(e))
              .toList(),
    );
  }
}

class MovieCategory {
  final int? id;
  final String? name;

  const MovieCategory({this.id, this.name});

  factory MovieCategory.fromJson(Map<String, dynamic> json) {
    return MovieCategory(id: json["id"], name: json["name"]);
  }
}
