class CategoryResponse {
  final List<Category>? genres;

  const CategoryResponse({this.genres});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      genres:
          json["genres"] == null
              ? null
              : (json["genres"] as List)
                  .map((e) => Category.fromJson(e))
                  .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (genres != null)
      data["genres"] = genres!.map((e) => e.toJson()).toList();
    return data;
  }
}

class Category {
  final int? id;
  final String? name;

  const Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json["id"], name: json["name"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}
