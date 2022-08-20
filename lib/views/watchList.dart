import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/view_model/watchList.dart';
import 'package:movie/views/HomeFragments/browse.dart';
import 'package:movie/views/HomeFragments/homeBody.dart';
import 'package:movie/widgets.dart/rowDetails.dart';
import 'package:movie/widgets.dart/widgets.dart';
import 'package:provider/provider.dart';

class WatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    WatchListVM watchListProvider = Provider.of(context);
    List<Movie> watchListMovies = watchListProvider.watchListMovies!;
    return watchListProvider.watchListMovies!.isEmpty
        ? Container(
            padding: EdgeInsets.all(screenWidth * .1),
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Want To Save a Movie For Later?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyThemeData.text, fontSize: screenWidth * .07),
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                Text(
                  'See Popular movies And Top Rated NOW !',
                  style: TextStyle(
                      color: MyThemeData.text.withAlpha(150),
                      fontSize: screenWidth * .04),
                ),
             ],
            ),
          )
        : watchListProvider.isLoading
            ? Widgets.loading(screenHeight, screenWidth)
            : rowDetails(watchListMovies);
  }
}
