// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/view_model/watchList.dart';
import 'package:movie/views/movieDetailsa.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class noDetailsCard extends StatefulWidget {
  bool? needpadding = true; //false in details card call
  Movie movie;

  noDetailsCard(this.movie, [this.needpadding = true]);

  @override
  State<noDetailsCard> createState() => _noDetailsCardState();
}

class _noDetailsCardState extends State<noDetailsCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    WatchListVM watchListProvider = Provider.of(context);

    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(
                      widget.movie,
                    )))
      },
      child: Padding(
        padding: widget.needpadding!
            ? EdgeInsets.only(
                right: screenWidth * .05,
                left: screenWidth * .05,
                bottom: screenWidth * .1)
            : EdgeInsets.all(0),
        child: Container(
          height: widget.needpadding!
              ? //details card
              screenHeight * .3
              : screenHeight * .25,
          width: screenWidth * .5,
          decoration: BoxDecoration(
            borderRadius: (!widget.needpadding!
                ? BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))
                : BorderRadius.circular(5)),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: widget.movie.posterPath != ''
                    ? NetworkImage(
                        'https://image.tmdb.org/t/p/w185/${widget.movie.posterPath}')
                    : NetworkImage(
                        'https://image.tmdb.org/t/p/w185/${widget.movie.posterPath}')),
          ),
          //to make add watch icon in top left
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: watchListProvider.isInWatchList(widget.movie.title)
                          ? MyThemeData.clicked
                          : MyThemeData.detText,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(5))),
                  padding: EdgeInsets.all(3),
                  ///////////add//////////////////////
                  child: IconButton(
                    icon: Icon(
                      watchListProvider.isInWatchList(widget.movie.title)
                          ? Icons.check
                          : Icons.add,
                      size: screenWidth * .08,
                      color: MyThemeData.text,
                    ),
                    onPressed: () {
                      watchListProvider.addToWatchList(
                          widget.movie.id, widget.movie);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
