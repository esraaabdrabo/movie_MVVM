class VideoResponse {
late  int id;
  List<Results>? results;
  bool? success;
  int? statusCode;
  String? statusMessage;

  VideoResponse(
      {required this.id,
      this.results,
      this.statusCode,
      this.statusMessage,
      this.success});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["results"] is List)
      this.results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    if (this.results != null)
      data["results"] = this.results!.map((e) => e.toJson()).toList();
    return data;
  }
}

class Results {
 late String iso6391;
 late String iso31661;
 late String name;
 late String key;
 late String publishedAt;
 late String site;
 late int size;
 late String type;
 late bool official;
 late String id;

  Results(
      { required this.iso6391,
     required this.iso31661,
     required this.name,
    required  this.key,
    required  this.publishedAt,
    required  this.site,
    required  this.size,
    required  this.type,
    required  this.official,
    required  this.id});

  Results.fromJson(Map<String, dynamic> json) {
    if (json["iso_639_1"] is String) this.iso6391 = json["iso_639_1"];
    if (json["iso_3166_1"] is String) this.iso31661 = json["iso_3166_1"];
    if (json["name"] is String) this.name = json["name"];
    if (json["key"] is String) this.key = json["key"];
    if (json["published_at"] is String) this.publishedAt = json["published_at"];
    if (json["site"] is String) this.site = json["site"];
    if (json["size"] is int) this.size = json["size"];
    if (json["type"] is String) this.type = json["type"];
    if (json["official"] is bool) this.official = json["official"];
    if (json["id"] is String) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["iso_639_1"] = this.iso6391;
    data["iso_3166_1"] = this.iso31661;
    data["name"] = this.name;
    data["key"] = this.key;
    data["published_at"] = this.publishedAt;
    data["site"] = this.site;
    data["size"] = this.size;
    data["type"] = this.type;
    data["official"] = this.official;
    data["id"] = this.id;
    return data;
  }
}
