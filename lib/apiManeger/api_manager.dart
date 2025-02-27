import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mov/Model/category.dart';
import 'package:mov/Model/response.dart';

class movieDataBaseApi {
  static Future<List<Movie>?> getMovieList(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Movies moviesList = Movies.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      throw Exception('failed from get $url ${response.statusCode}');
    }
  }

  static Future<List<Category>?> getCategoryList(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final CategoryResponse categoryList = CategoryResponse.fromJson(
        jsonDecode(response.body),
      );
      return categoryList.genres;
    }
    throw Exception('failed from get category ${response.statusCode}');
  }
}
