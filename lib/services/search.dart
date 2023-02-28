import 'dart:convert';
import 'package:movie/services/constants.dart';

import '../Model/response.dart';
import 'package:http/http.dart' as http;

class SearchSV {
  static getSearchedMovie(String name) async {
    String searchURL = '${SVconstants.searchUrl}$name';

    var response = await http.get(Uri.parse(searchURL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
