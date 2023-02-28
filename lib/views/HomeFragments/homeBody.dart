import 'package:flutter/material.dart';
import 'package:movie/view_model/homeBody.dart';
import 'package:movie/view_model/watchList.dart';
import 'package:movie/views/animation/app_bar.dart';
import 'package:movie/widgets.dart/movie_details.dart/movie_details.dart';
import 'package:provider/provider.dart';
import '../../widgets.dart/ourListvView.dart';
import '../../widgets.dart/loading.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
        create: (context) => HomeBodyVM(),
        builder: (context, child) {
          //dont remove this to know which movie is in watchlist
          // ignore: unused_local_variable
          WatchListVM watchListProvider = Provider.of(context);
          HomeBodyVM homeProvider = Provider.of(context);
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
                            containMostPopular: true),
                        SizedBox(
                          height: screenHeight * .5,
                          child: OurListView(
                              'POPULAR', false, homeProvider.popular!),
                        ),
                      ],
                    ),
              //space
              SizedBox(
                height: screenHeight * .03,
              ),
              //top rated
              homeProvider.isTopRatedLoading
                  ? Loading()
                  : SizedBox(
                      height: screenHeight * .5,
                      child: OurListView(
                          'TOP RATED', true, homeProvider.topRated!),
                    ),
              //space
              SizedBox(
                height: screenHeight * .03,
              ),
            ],
          );
        });
  }
}
