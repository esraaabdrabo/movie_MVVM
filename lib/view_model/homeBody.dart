import 'package:flutter/cupertino.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/services/popular.dart';
import 'package:movie/services/topRated.dart';

class HomeBodyVM extends ChangeNotifier {
  List<movie?>? popular = [];
  List<movie?>? topRated = [];
  bool isPopularLoading = false;
  bool isTopRatedLoading = false;
  String popularErrorMess = '';

  HomeBodyVM() {
    getPopular();
    getTopRated();
  }

  changeIsPopularLoading(bool value) {
    isPopularLoading = value;
    notifyListeners();
  }

  changeIsTopRatedLoading(bool value) {
    isTopRatedLoading = value;
    notifyListeners();
  }

  getPopular() async {
    changeIsPopularLoading(true);
    var res = await PopularSV.getPopularMovieList();
    if (res is List<movie>?) {
      popular = res;
    } else {
      popularErrorMess = res;
    }
    changeIsPopularLoading(false);
  }

  getTopRated() async {
    changeIsTopRatedLoading(true);

    var res = await TopRatedSV.getTopRatedMovieList();
    if (res is List<movie>?) {
      topRated = res;
    }
    changeIsTopRatedLoading(false);
  }
}
