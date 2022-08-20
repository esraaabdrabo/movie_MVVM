import 'package:flutter/cupertino.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/services/categoryMovies.dart';

class CategoryMoviesVM extends ChangeNotifier {
  List<Movie>? categoryMovies = [];
  bool isLoading = false;
  String errorMess = '';

  CategoryMoviesVM(String name) {
    getCategoryMovies(name);
  }
  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getCategoryMovies(String name) async {
    changeIsLoading(true);

    var res = await CategoryMoviesSV.getCategoryList(name);
    if (res is List<Movie>?) {
      categoryMovies = res;
    } else {
      errorMess = res;
    }

    changeIsLoading(false);
  }
}
