import 'package:mov/services/movieDetails.dart';
import '../model/movies.dart';
import 'package:flutter/material.dart';

class MoviesDetailsVM extends ChangeNotifier {
  List<Movie>? similar = [];

  bool isLoading = false;

  String errorMess = '';

  MoviesDetailsVM(int id) {
    getSimilar(id);
  }
  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getSimilar(int id) async {
    changeIsLoading(true);

    final res = await MovieDetailsSV.getSimilar(id);
    if (res is List<Movie>?) {
      similar = res;
    } else {
      errorMess = res;
    }
    changeIsLoading(false);
  }
}
