import 'dart:convert';
import 'package:mov/model/movie_category.dart';
import 'package:http/http.dart' as http;
import 'package:mov/services/constants.dart';

class BrowseSV {
  static getCategories() async {
    final String categoriesURL = SVconstants.categoriesURL;

    final http.Response response = await http.get(Uri.parse(categoriesURL));

    if (response.statusCode == 200) {
      final MoviesCategories categoriesList = MoviesCategories.fromJson(
        jsonDecode(response.body),
      );

      return categoriesList.data;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
