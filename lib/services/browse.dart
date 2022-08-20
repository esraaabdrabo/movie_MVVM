import 'dart:convert';
import 'package:movie/Model/category.dart';
import 'package:http/http.dart' as http;

class BrowseSV {
  static getCategories() async {
    String categoriesURL =
        'https://api.themoviedb.org/3/genre/movie/list?api_key=36dac39aff2bc256201415d1f2d33cdf';

    var response = await http.get(Uri.parse(categoriesURL));

    if (response.statusCode == 200) {
      CategoryResponse categoriesList =
          CategoryResponse.fromJson(jsonDecode(response.body));

      return categoriesList.genres;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
