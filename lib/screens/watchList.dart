import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:movie/widgets.dart/rowDetails.dart';

class watchList extends StatefulWidget {
  @override
  State<watchList> createState() => _watchListState();
}

class _watchListState extends State<watchList> {
  static List<movie>? movieList = [];
  late CollectionReference<movie> watchListRes;
  @override
  void initState() {
    super.initState();
    watchListRes = FirebaseFirestore.instance
        .collection('watchList')
        .withConverter<movie>(
            fromFirestore: (Snapshot, _) => movie.fromJson(Snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson());

    getWatchList();
  }

  void getWatchList() {
    watchListRes.get().then((document) {
      document.docs.map((movie) => movie.data()).forEach((element) {
        movieList!.add(element);
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: movieList!.length,
          itemBuilder: (context, index) {
            return rowDetails(movieList);
          }),
    );
  }
}

class audio {
late  File audioFile;
}
