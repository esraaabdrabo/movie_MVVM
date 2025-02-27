import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/assets/functions.dart';
import 'package:mov/myThemeData.dart';
import 'package:mov/view_model/watchList.dart';
import 'package:mov/views/movieDetailsa.dart';
import 'package:mov/widgets.dart/cached_img.dart';
import 'package:mov/widgets.dart/loading.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NoDetailsCard extends StatefulWidget {
  bool? needpadding = true; //false in details card call
  Movie movie;

  NoDetailsCard(this.movie, [this.needpadding = true]);

  @override
  State<NoDetailsCard> createState() => _NoDetailsCardState();
}

class _NoDetailsCardState extends State<NoDetailsCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    WatchListVM watchListProvider = Provider.of(context);

    return Stack(
      children: [
        InkWell(
          onTap: () {
            goto(context: context, screen: MoreLikeThis(widget.movie));
          },
          child: Padding(
            padding:
                widget.needpadding!
                    ? EdgeInsets.only(
                      right: screenWidth * .05,
                      left: screenWidth * .05,
                      bottom: screenWidth * .1,
                    )
                    : EdgeInsets.zero,
            child: Stack(
              children: [
                Container(
                  height:
                      widget.needpadding!
                          ? //details card
                          screenHeight * .3
                          : screenHeight * .25,
                  width: screenWidth * .5,
                  decoration: BoxDecoration(
                    borderRadius:
                        (!widget.needpadding!
                            ? BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            )
                            : BorderRadius.circular(5)),
                  ),
                  child: CachedImg(
                    path:
                        'https://image.tmdb.org/t/p/w185/${widget.movie.posterPath}',
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color:
                        watchListProvider.isInWatchList(widget.movie.id)
                            ? MyThemeData.golden
                            : MyThemeData.mediumGray,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.all(3),
                  //add//
                  child: IconButton(
                    icon: Icon(
                      watchListProvider.isInWatchList(widget.movie.id)
                          ? Icons.check
                          : Icons.add,
                      size: screenWidth * .08,
                      color: MyThemeData.white60,
                    ),
                    onPressed: () {
                      watchListProvider.addToWatchList(widget.movie);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
