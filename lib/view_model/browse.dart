import 'package:flutter/cupertino.dart';
import 'package:mov/services/browse.dart';
import '../model/movie_category.dart';

class BrowseVM extends ChangeNotifier {
  List<MovieCategory>? categories = [];
  bool isLoading = false;
  String errorMess = '';

  BrowseVM() {
    getCategories();
  }
  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getCategories() async {
    changeIsLoading(true);

    final res = await BrowseSV.getCategories();
    // we can use record here or Either.
    if (res is List<MovieCategory>?) {
      categories = res;
    } else {
      errorMess = res;
    }

    changeIsLoading(false);
  }
}
