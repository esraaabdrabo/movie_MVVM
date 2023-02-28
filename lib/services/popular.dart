import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/services/constants.dart';
import '../Model/response.dart';

class PopularSV {
  static getPopularMovieList() async {
    var response = await http.get(Uri.parse(SVconstants.popularUrl));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
