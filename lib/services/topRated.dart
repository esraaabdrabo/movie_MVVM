import 'dart:convert';

import '../dataModel/response.dart';
import 'package:http/http.dart' as http;

class TopRatedSV {
  static getTopRatedMovieList() async {
    String topRatedURL =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=36dac39aff2bc256201415d1f2d33cdf';

    var response = await http.get(Uri.parse(topRatedURL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
