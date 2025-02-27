import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mov/Model/category.dart';
import 'package:mov/Model/video.dart';

class PoopularSV {
  static Future<List<Category>?> getCategoryList(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final categoryList = CategoryResponse.fromJson(jsonDecode(response.body));
      return categoryList.genres;
    }
    throw Exception('failed from get category ${response.statusCode}');
  }

  static Future<String?> getMovieVideo(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final resultList = VideoResponse.fromJson(jsonDecode(response.body));
      return 'https://www.youtube.com/watch?v=${resultList.results![0].key}';
    } else {
      throw Exception('failed from get $url ${response.statusCode}');
    }
  }
}
