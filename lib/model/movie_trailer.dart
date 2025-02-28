class VideoResponse {
  final MovieTrailer? trailer;

  const VideoResponse({required this.trailer});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    final List data = json["results"] as List;
    return VideoResponse(
      trailer:
          data.isEmpty
              ? null
              : MovieTrailer.fromJson(data[0] as Map<String, dynamic>),
    );
  }
}

class MovieTrailer {
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

  const MovieTrailer({
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

  factory MovieTrailer.fromJson(Map<String, dynamic> json) {
    return MovieTrailer(
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
