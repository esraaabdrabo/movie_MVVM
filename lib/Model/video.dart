class VideoResponse {
  final int id;
  final List<Results>? results;

  const VideoResponse({required this.id, this.results});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return VideoResponse(
      id: json['id'],
      results:
          json["results"] == null
              ? null
              : (json["results"] as List)
                  .map((e) => Results.fromJson(e))
                  .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    if (results != null)
      data["results"] = results!.map((e) => e.toJson()).toList();
    return data;
  }
}

class Results {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String publishedAt;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String id;

  Results({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.publishedAt,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.id,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      iso6391: json["iso_639_1"],
      iso31661: json["iso_3166_1"],
      name: json["name"],
      key: json["key"],
      publishedAt: json["published_at"],
      site: json["site"],
      size: json["size"],
      type: json["type"],
      official: json["official"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["iso_639_1"] = iso6391;
    data["iso_3166_1"] = iso31661;
    data["name"] = name;
    data["key"] = key;
    data["published_at"] = publishedAt;
    data["site"] = site;
    data["size"] = size;
    data["type"] = type;
    data["official"] = official;
    data["id"] = id;
    return data;
  }
}
