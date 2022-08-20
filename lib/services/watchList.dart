import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/response.dart';

class WatchListSV {
  WatchListSV() {
    getRef();
  }
  CollectionReference<Movie>? watchListRef;
  void getRef() {
    watchListRef = FirebaseFirestore.instance
        .collection('watchList')
        .withConverter<Movie>(
            fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson());
  }

  List<Movie>? getWatchListMovies() {
    List<Movie>? watchListMovies = [];
    watchListRef!.get().then((document) {
      document.docs.map((movie) => movie.data()).forEach((element) {
        watchListMovies.add(element);
      });
    }).onError((error, stackTrace) {
      throw error!;
    });
    return watchListMovies;
  }

  bool addToWatchList(int id, Movie addedMovie) {
    watchListRef!
        .doc(id.toString())
        .set(addedMovie)
        .then((value) => true)
        .onError((error, stackTrace) {
      return false;
    });
    return true;
  }

  Future<bool> removeFromWatchList(int id) async {
    await watchListRef!
        .doc(id.toString())
        .delete()
        .onError((error, stackTrace) {
      print(error.toString());
      return false;
    });
    return true;
  }
}
