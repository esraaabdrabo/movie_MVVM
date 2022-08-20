import 'package:flutter/cupertino.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/services/popular.dart';
import 'package:movie/services/topRated.dart';

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
    if (res is List<Movie>?) {
      popular = res;
      mostPopular = popular![0];
    } else {
      popularErrorMess = res;
    }
    changeIsPopularLoading(false);
  }

  getTopRated() async {
    changeIsTopRatedLoading(true);

    var res = await TopRatedSV.getTopRatedMovieList();
    if (res is List<Movie>?) {
      topRated = res;
    }
    changeIsTopRatedLoading(false);
  }

  String languageCompleteWord(String movieLanguage) {
    return 'language : ${movieLanguage == 'es' ? 'spanish' : movieLanguage == 'en' ? 'english' : movieLanguage == 'hi' ? 'hindi' : movieLanguage == 'ar' ? 'arabic' : movieLanguage == 'fa' ? 'persian' : movieLanguage == 'fr' ? 'french' : movieLanguage} ';
  }
}
