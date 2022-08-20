import 'dart:convert';
import '../Model/response.dart';
import 'package:http/http.dart' as http;

class SearchSV {
  static getSearchedMovie(String name) async {
    String searchURL =
        'https://api.themoviedb.org/3/search/movie?api_key=36dac39aff2bc256201415d1f2d33cdf&query=$name';

    var response = await http.get(Uri.parse(searchURL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
