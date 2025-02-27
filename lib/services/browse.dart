import 'dart:convert';
import 'package:mov/Model/category.dart';
import 'package:http/http.dart' as http;
import 'package:mov/services/constants.dart';

class BrowseSV {
  static getCategories() async {
    String categoriesURL = SVconstants.categoriesURL;

    final response = await http.get(Uri.parse(categoriesURL));

    if (response.statusCode == 200) {
      CategoryResponse categoriesList = CategoryResponse.fromJson(
        jsonDecode(response.body),
      );

      return categoriesList.genres;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
