import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/services/watchList.dart';

class WatchListVM extends ChangeNotifier {
  List<Movie>? watchListMovies = [];
  bool isLoading = false;
  String errorMess = '';
  bool isAdditionDone = false;

  WatchListVM() {
    getMovies();
  }

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  getMovies() {
    changeIsLoading(true);
    watchListMovies = WatchListSV().getWatchListMovies();
    changeIsLoading(false);
  }

  addToWatchList(int id, Movie addedMovie) {
    if (isInWatchList(addedMovie.title)) {
      removeFromWatchList(id);
    } else {
      if (WatchListSV().addToWatchList(id, addedMovie)) {
        watchListMovies!.add(addedMovie);
      }
    }
    notifyListeners();
  }

  removeFromWatchList(int id) async {
    changeIsLoading(true);
    if (await WatchListSV().removeFromWatchList(id)) {
      watchListMovies!.removeWhere((element) => element.id == id);
    }
    changeIsLoading(false);
  }

  bool isInWatchList(String title) {
    return watchListMovies!.indexWhere((element) => element.title == title) >=
        0;
  }
}
