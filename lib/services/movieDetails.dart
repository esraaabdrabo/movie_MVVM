import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mov/services/constants.dart';
import '../model/movies.dart';

class MovieDetailsSV {
  static getSimilar(int id) async {
    String uRL =
        '${SVconstants.baseUrl}movie/$id/similar?${SVconstants.apiKey}';
    final response = await http.get(Uri.parse(uRL));

    if (response.statusCode == 200) {
      Movies moviesList = Movies.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
