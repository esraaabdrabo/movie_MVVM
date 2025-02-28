import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mov/model/movies.dart';
import 'package:mov/services/constants.dart';

class CategoryMoviesSV {
  static getCategoryList(String categoryName) async {
    final String url = '${SVconstants.categoryMoviesUrl}$categoryName';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final categoryMoviesList = Movies.fromJson(jsonDecode(response.body));
      return categoryMoviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
