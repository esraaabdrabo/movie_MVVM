import 'package:flutter/cupertino.dart';
import 'package:movie/services/browse.dart';
import '../dataModel/category.dart';

class BrowseVM extends ChangeNotifier {
  List<category>? categories = [];
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
    if (res is List<category>?) {
      categories = res;
    } else {
      errorMess = res;
    }

    changeIsLoading(false);
  }
}
