import 'package:flutter/material.dart';
import 'package:mov/model/movies.dart';
import 'package:mov/view_model/homeBody.dart';
import 'package:mov/view_model/watchList.dart';
import 'package:mov/animation/app_bar.dart';
import 'package:mov/widgets/movie_details/movie_details.dart';
import 'package:mov/widgets/movie_details_card.dart';
import 'package:provider/provider.dart';
import '../widgets/app_list_view.dart';
import '../widgets/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => HomeBodyVM(),
      builder: (context, child) {
        //dont remove this to know which movie is in watchlist
        Provider.of<WatchListVM>(context);
        final HomeBodyVM homeProvider = Provider.of(context);
        return ListView(
          physics: BouncingScrollPhysics(),
          children: [
            AnimatedAppBar(maxHeight: screenHeight * .1),
            //most popular movie
            homeProvider.isPopularLoading
                ? Loading()
                : Column(
                  // what if there's no popular for any reason? (refactor)
                  children: [
                    MovieDetails(
                      movie: homeProvider.popular![0]!,
                      homeProvider: homeProvider,
                      containMostPopular: true,
                    ),
                    SizedBox(
                      height: screenHeight * .5,
                      child: AppListView<Movie?>(
                        title: 'POPULAR',
                        data: homeProvider.popular!,
                        builder:
                            (index) => MovieDetailsCard(
                              homeProvider.popular![index]!,
                              showDetails: false,
                            ),
                      ),
                    ),
                  ],
                ),
            //space
            SizedBox(height: screenHeight * .03),
            //top rated
            homeProvider.isTopRatedLoading
                ? Loading()
                : SizedBox(
                  // same here (refactor)
                  height: screenHeight * .5,
                  child: AppListView<Movie?>(
                    title: 'TOP RATED',
                    data: homeProvider.topRated!,
                    builder:
                        (index) => MovieDetailsCard(
                          homeProvider.topRated![index]!,
                          showDetails: true,
                        ),
                  ),
                ),
            //space
            SizedBox(height: screenHeight * .03),
          ],
        );
      },
    );
  }
}
