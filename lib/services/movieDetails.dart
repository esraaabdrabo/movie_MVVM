import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/services/constants.dart';
import '../Model/response.dart';

class MovieDetailsSV {
  static getSimilar(int id) async {
    String uRL =
        '${SVconstants.baseUrl}movie/$id/similar?${SVconstants.apiKey}';
    var response = await http.get(Uri.parse(uRL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
