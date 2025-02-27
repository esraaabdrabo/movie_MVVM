import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mov/services/constants.dart';
import '../Model/response.dart';

class PopularSV {
  static getPopularMovieList() async {
    final response = await http.get(Uri.parse(SVconstants.popularUrl));

    if (response.statusCode == 200) {
      Movies moviesList = Movies.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
