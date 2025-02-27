import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/myThemeData.dart';
import 'package:mov/view_model/watchList.dart';
import 'package:mov/widgets/search_results.dart';
import 'package:mov/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../animation/app_bar.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final WatchListVM watchListProvider = Provider.of<WatchListVM>(context);
    final List<Movie> watchListMovies = watchListProvider.watchListMovies!;
    return watchListProvider.watchListMovies!.isEmpty
        ? Padding(
          padding: EdgeInsets.only(top: .05 * screenHeight),
          child: Container(
            padding: EdgeInsets.all(screenWidth * .1),
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedAppBar(end: screenHeight * .1),
                Text(
                  'Want To Save a Movie For Later?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyThemeData.white60,
                    fontSize: screenWidth * .07,
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                Text(
                  'See Popular movies And Top Rated NOW !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyThemeData.white60.withAlpha(150),
                    fontSize: screenWidth * .04,
                  ),
                ),
              ],
            ),
          ),
        )
        : watchListProvider.isLoading
        ? Loading()
        : ListView(
          children: [
            AnimatedAppBar(end: screenHeight * .1),
            SearchResults(watchListMovies),
          ],
        );
  }
}
