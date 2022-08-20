import 'package:flutter/cupertino.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/services/search.dart';

class SearchVM extends ChangeNotifier {
  List<Movie>? searchedMovies = [];
  bool isLoading = false;
  String errorMess = '';
  bool isSearchUsed = false;

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getSearchedMovies(String name) async {
    changeIsLoading(true);

    var res = await SearchSV.getSearchedMovie(name);
    if (res is List<Movie>?) {
      searchedMovies = res;
    } else {
      errorMess = res;
    }
    isSearchUsed = true;
    changeIsLoading(false);
  }
}
