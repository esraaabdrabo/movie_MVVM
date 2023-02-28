import 'package:movie/services/movieDetails.dart';
import '../Model/response.dart';
import 'package:flutter/material.dart';

class MoviesDetailsVM extends ChangeNotifier {
  List<Movie>? similar = [];

  bool isLoading = false;

  String errorMess = '';

  MoviesDetailsVM(int id) {
    getSimilar(id);
  }

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getSimilar(int id) async {
    changeIsLoading(true);

    var res = await MovieDetailsSV.getSimilar(id);
    if (res is List<Movie>?) {
      similar = res;
    } else {
      errorMess = res;
    }
    changeIsLoading(false);
  }
}
