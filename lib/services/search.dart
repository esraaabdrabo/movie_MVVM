import 'dart:convert';
import 'package:mov/services/constants.dart';

import '../model/movies.dart';
import 'package:http/http.dart' as http;

class SearchSV {
  static getSearchedMovie(String name) async {
    String searchURL = '${SVconstants.searchUrl}$name';

    final response = await http.get(Uri.parse(searchURL));

    if (response.statusCode == 200) {
      Movies moviesList = Movies.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      //TODO ENHANCE ERROR HANDLING (REFACTOR)
      return 'Failed To Reach Server';
    }
  }
}
