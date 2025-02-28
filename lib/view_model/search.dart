import 'package:flutter/cupertino.dart';
import 'package:mov/model/movies.dart';
import 'package:mov/services/search.dart';

class SearchVM extends ChangeNotifier {
  List<Movie> searchedMovies = [];
  bool isLoading = false;
  String errorMessage = '';
  bool isSearchUsed = false;

  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getSearchedMovies(String name) async {
    changeIsLoading(true);

    final res = await SearchSV.getSearchedMovie(name);
    if (res is List<Movie>) {
      searchedMovies = res;
    } else {
      errorMessage = res;
    }
    isSearchUsed = true;
    changeIsLoading(false);
  }
}
