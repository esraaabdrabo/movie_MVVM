import 'package:flutter/cupertino.dart';
import 'package:movie/services/browse.dart';
import '../Model/category.dart';

class BrowseVM extends ChangeNotifier {
  List<Category>? categories = [];
  bool isLoading = false;
  String errorMess = '';

  BrowseVM() {
    getCategories();
  }
  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getCategories() async {
    changeIsLoading(true);

    var res = await BrowseSV.getCategories();
    if (res is List<Category>?) {
      categories = res;
    } else {
      errorMess = res;
    }

    changeIsLoading(false);
  }
}
