import 'package:flutter/cupertino.dart';
import 'package:mov/services/browse.dart';
import '../Model/category.dart';

class BrowseVM extends ChangeNotifier {
  List<Category>? categories = [];
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
    if (res is List<Category>?) {
      categories = res;
    } else {
      errorMess = res;
    }

    changeIsLoading(false);
  }
}
