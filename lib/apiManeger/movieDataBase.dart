import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/Model/category.dart';

import '../Model/response.dart';

class movieDataBaseApi {
  static Future<List<Movie>?> getMovieList(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      print('in 200 $link');
      var moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      throw Exception('failed from get $link ${response.statusCode}');
    }
  }

  static Future<List<Category>?> getCategoryList(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      print('in 200 $link');
      var categoryList = CategoryResponse.fromJson(jsonDecode(response.body));
      return categoryList.genres;
    }
    throw Exception('failed from get category ${response.statusCode}');
  }
}
