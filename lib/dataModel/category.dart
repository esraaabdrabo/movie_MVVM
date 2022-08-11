
class categoryResponse {
  List<category>? genres;

  categoryResponse({this.genres});

  categoryResponse.fromJson(Map<String, dynamic> json) {
    if(json["genres"] is List)
      this.genres = json["genres"]==null ? null : (json["genres"] as List).map((e)=>category.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.genres != null)
      data["genres"] = this.genres!.map((e)=>e.toJson()).toList();
    return data;
  }
}

class category {
  int? id;
  String? name;

  category({this.id, this.name});

  category.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["name"] is String)
      this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    return data;
  }
}