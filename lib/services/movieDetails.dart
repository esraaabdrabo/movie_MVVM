import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dataModel/response.dart';

class MovieDetailsSV {
  static getSimilar(int id) async {
    String uRL =
        'https://api.themoviedb.org/3/movie/$id/similar?api_key=36dac39aff2bc256201415d1f2d33cdf';
    var response = await http.get(Uri.parse(uRL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
