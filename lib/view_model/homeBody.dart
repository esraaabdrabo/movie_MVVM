import 'package:flutter/cupertino.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/services/popular.dart';
import 'package:mov/services/topRated.dart';

class HomeBodyVM extends ChangeNotifier {
  List<Movie?>? popular = [];
  List<Movie?>? topRated = [];
  bool isPopularLoading = false;
  bool isTopRatedLoading = false;
  String popularErrorMess = '';
  Movie? mostPopular;
  HomeBodyVM() {
    getPopular();
    getTopRated();
  }

  void changeIsPopularLoading(bool value) {
    isPopularLoading = value;
    notifyListeners();
  }

  void changeIsTopRatedLoading(bool value) {
    isTopRatedLoading = value;
    notifyListeners();
  }

  Future<void> getPopular() async {
    changeIsPopularLoading(true);
    final res = await PopularSV.getPopularMovieList();
    if (res is List<Movie>?) {
      popular = res;
      mostPopular = popular![0];
    } else {
      popularErrorMess = res;
    }
    changeIsPopularLoading(false);
  }

  Future<void> getTopRated() async {
    changeIsTopRatedLoading(true);

    final res = await TopRatedSV.getTopRatedMovieList();
    if (res is List<Movie>?) {
      topRated = res;
    }
    changeIsTopRatedLoading(false);
  }
}
