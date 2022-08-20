import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/response.dart';

class PopularSV {
  static getPopularMovieList() async {
    String popularURL =
        'https://api.themoviedb.org/3/movie/popular?api_key=36dac39aff2bc256201415d1f2d33cdf';
    var response = await http.get(Uri.parse(popularURL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
