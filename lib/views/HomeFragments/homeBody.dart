import 'package:flutter/material.dart';
import 'package:movie/view_model/homeBody.dart';
import 'package:movie/view_model/watchList.dart';
import 'package:provider/provider.dart';
import '../../widgets.dart/ourListvView.dart';
import '../../widgets.dart/widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
        create: (context) => HomeBodyVM(),
        builder: (context, child) {
          //dnt remove this to know which movie is in watchlist
          // ignore: unused_local_variable
          WatchListVM watchListProvider = Provider.of(context);
          HomeBodyVM homeProvider = Provider.of(context);
          return homeProvider.isPopularLoading || homeProvider.isTopRatedLoading
              ? Widgets.loading(screenHeight, screenWidth)
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //most popular movie
                      Widgets.movieDetails(screenHeight, screenWidth,
                          homeProvider.popular![0]!, homeProvider, true),
                      //popular
                      Container(
                        height: screenHeight * .5,
                        child: OurListView(
                            'POPULAR', false, homeProvider.popular!),
                      ),
                      //space
                      Container(
                        height: screenHeight * .03,
                      ),
                      //top rated
                      Container(
                        height: screenHeight * .5,
                        child: OurListView(
                            'TOP RATED', true, homeProvider.topRated!),
                      ),
                      //space
                      Container(
                        height: screenHeight * .03,
                      ),
                    ],
                  ),
                );
        });
  }
}
