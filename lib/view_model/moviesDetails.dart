import 'package:movie/services/movieDetails.dart';
import '../dataModel/response.dart';
import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';

class MoviesDetailsVM extends ChangeNotifier {
  List<movie>? similar = [];

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
    if (res is List<movie>?) {
      similar = res;
    } else {
      errorMess = res;
    }
    changeIsLoading(false);
  }
}
