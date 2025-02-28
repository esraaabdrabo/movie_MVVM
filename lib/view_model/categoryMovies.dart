import 'package:flutter/cupertino.dart';
import 'package:mov/model/movies.dart';
import 'package:mov/services/categoryMovies.dart';

class CategoryMoviesVM extends ChangeNotifier {
  List<Movie>? categoryMovies = [];
  bool isLoading = false;
  String errorMess = '';

  CategoryMoviesVM(String name) {
    getCategoryMovies(name);
  }
  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getCategoryMovies(String name) async {
    changeIsLoading(true);

    final res = await CategoryMoviesSV.getCategoryList(name);
    if (res is List<Movie>?) {
      categoryMovies = res;
    } else {
      errorMess = res;
    }

    changeIsLoading(false);
  }
}
