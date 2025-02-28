import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mov/model/movie_category.dart';
import 'package:mov/model/movie_trailer.dart';

class PoopularSV {
  static Future<List<MovieCategory>?> getCategoryList(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final categoryList = MoviesCategories.fromJson(jsonDecode(response.body));
      return categoryList.data;
    }
    throw Exception('failed from get category ${response.statusCode}');
  }

  static Future<String?> getMovieVideo(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final MovieTrailer? result =
          VideoResponse.fromJson(jsonDecode(response.body)).trailer;
      if (result == null) return null;
      return 'https://www.youtube.com/watch?v=${result.key}';
    } else {
      throw Exception('failed from get $url ${response.statusCode}');
    }
  }
}
