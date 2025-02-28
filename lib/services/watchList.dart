import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mov/services/constants.dart';
import '../model/movies.dart';

// This feture must be offline, so we will use local storage to store the watchlist. (refactor)
class WatchListSV {
  WatchListSV() {
    getRef();
  }
  CollectionReference<Movie>? watchListRef;
  void getRef() {
    watchListRef = FirebaseFirestore.instance
        .collection(SVconstants.watchListCollectionKey)
        .withConverter<Movie>(
          fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }

  List<Movie>? getWatchListMovies() {
    List<Movie>? watchListMovies = [];
    watchListRef!
        .get()
        .then((document) {
          document.docs.map((movie) => movie.data()).forEach((element) {
            watchListMovies.add(element);
          });
        })
        .onError((error, stackTrace) {
          throw error!;
        });
    return watchListMovies;
  }

  bool addToWatchList(Movie addedMovie) {
    watchListRef!
        .doc(addedMovie.id.toString())
        .set(addedMovie)
        .then((value) => true)
        .onError((error, stackTrace) {
          return false;
        });
    return true;
  }

  Future<bool> removeFromWatchList(int id) async {
    // since there's no authentication for this app, we can just store the id in DB and remove it locally. Firebase will be used only if we have users and we need to sync data between devices.
    await watchListRef!.doc(id.toString()).delete().onError((_, __) {
      return false;
    });
    return true;
  }
}
