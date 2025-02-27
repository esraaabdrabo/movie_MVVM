import 'package:flutter/material.dart';
import 'package:mov/view_model/homeBody.dart';
import 'package:mov/view_model/watchList.dart';
import 'package:mov/views/animation/app_bar.dart';
import 'package:mov/widgets/movie_details/movie_details.dart';
import 'package:provider/provider.dart';
import '../../widgets/our_list_view.dart';
import '../../widgets/loading.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
            AnimatedAppBar(end: screenHeight * .1),
            //most popular movie
            homeProvider.isPopularLoading
                ? Loading()
                : Column(
                  children: [
                    MovieDetails(
                      movie: homeProvider.popular![0]!,
                      homeProvider: homeProvider,
                      containMostPopular: true,
                    ),
                    SizedBox(
                      height: screenHeight * .5,
                      child: MoviesListView(
                        name: 'POPULAR',
                        needDetails: false,
                        movies: homeProvider.popular!,
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
                  height: screenHeight * .5,
                  child: MoviesListView(
                    name: 'TOP RATED',
                    needDetails: true,
                    movies: homeProvider.topRated!,
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
