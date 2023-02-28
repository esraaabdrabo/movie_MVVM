import 'dart:convert';

import 'package:movie/services/constants.dart';

import '../Model/response.dart';
import 'package:http/http.dart' as http;

class TopRatedSV {
  static getTopRatedMovieList() async {
    var response = await http.get(Uri.parse(SVconstants.topRatedUrl));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
