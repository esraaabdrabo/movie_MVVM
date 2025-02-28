import 'dart:convert';

import 'package:mov/services/constants.dart';

import '../model/movies.dart';
import 'package:http/http.dart' as http;

class TopRatedSV {
  static getTopRatedMovieList() async {
    final response = await http.get(Uri.parse(SVconstants.topRatedUrl));

    if (response.statusCode == 200) {
      Movies moviesList = Movies.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
