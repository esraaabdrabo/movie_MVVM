import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mov/model/movie_category.dart';

import '../model/movies.dart';

class MoviesApi {
  //TODO: -create client class to handle all requests, and add error handling (refactor).

  static Future<List<Movie>?> getMovieList(String link) async {
    final http.Response response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      final Movies moviesList = Movies.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      throw Exception('failed from get $link ${response.statusCode}');
    }
  }

  static Future<List<MovieCategory>?> getCategoryList(String link) async {
    final http.Response response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var categoryList = MoviesCategories.fromJson(jsonDecode(response.body));
      return categoryList.data;
    }
    throw Exception('failed from get category ${response.statusCode}');
  }
}
