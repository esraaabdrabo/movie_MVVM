import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/Model/response.dart';

class CategoryMoviesSV {
  static getCategoryList(String categoryName) async {
    String link =
        'https://api.themoviedb.org/3/discover/movie?api_key=36dac39aff2bc256201415d1f2d33cdf&with_genres=$categoryName';

    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var categoryMoviesList = Response.fromJson(jsonDecode(response.body));
      return categoryMoviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
