import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/Model/response.dart';
import 'package:movie/services/constants.dart';

class CategoryMoviesSV {
  static getCategoryList(String categoryName) async {
    String link = '${SVconstants.categoryMoviesUrl}$categoryName';

    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var categoryMoviesList = Response.fromJson(jsonDecode(response.body));
      return categoryMoviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
