import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/dataModel/category.dart';
import 'package:movie/dataModel/video.dart';

class PoopularSV {
  static Future<List<category>?> getCategoryList(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      print('in 200 $link');
      var categoryList = categoryResponse.fromJson(jsonDecode(response.body));
      return categoryList.genres;
    }
    throw Exception('failed from get category ${response.statusCode}');
  }

  static Future<String?> getMovieVideo(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      print('in 200 $link');
      var ResultList = VideoResponse.fromJson(jsonDecode(response.body));
      String videoLink =
          'https://www.youtube.com/watch?v=${ResultList.results![0].key}';
      return videoLink;
    } else {
      throw Exception('failed from get $link ${response.statusCode}');
    }
  }
}
