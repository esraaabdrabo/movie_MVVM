import 'package:flutter/material.dart';
import 'package:mov/model/movies.dart';
import 'package:mov/services/watchList.dart';

class WatchListVM extends ChangeNotifier {
  List<Movie>? watchListMovies = [];
  bool isLoading = false;
  String errorMess = '';

  WatchListVM() {
    getMovies();
  }

  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void getMovies() {
    changeIsLoading(true);
    watchListMovies = WatchListSV().getWatchListMovies();
    changeIsLoading(false);
  }

  void addToWatchList(Movie movie) {
    if (isInWatchList(movie.id)) {
      removeFromWatchList(movie);
    } else {
      // TODO: -singleton (refactor)
      if (WatchListSV().addToWatchList(movie)) {
        watchListMovies!.add(movie);
      }
    }
    notifyListeners();
  }

  void removeFromWatchList(Movie movie) async {
    changeIsLoading(true);
    if (await WatchListSV().removeFromWatchList(movie.id)) {
      watchListMovies!.remove(movie);
    }
    changeIsLoading(false);
  }

  bool isInWatchList(int id) {
    return watchListMovies!.indexWhere((element) => element.id == id) >= 0;
  }
}
