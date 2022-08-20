import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/view_model/moviesDetails.dart';
import 'package:movie/widgets.dart/widgets.dart';

import 'package:provider/provider.dart';
import '../myThemeData.dart';
import '../widgets.dart/ourListvView.dart';

// ignore: must_be_immutable
class MovieDetails extends StatelessWidget {
  Movie clickedMovie;
  MovieDetails(this.clickedMovie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.primary,
        title: Text(
          ' ${clickedMovie.title}'.toUpperCase(),
        ),
        centerTitle: true,
      ),
      backgroundColor: MyThemeData.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //cover img
            Widgets.movieDetails(screenHeight, screenWidth, clickedMovie),
            ChangeNotifierProvider(
                create: (context) => MoviesDetailsVM(clickedMovie.id),
                builder: (context, child) {
                  MoviesDetailsVM similarProvider = Provider.of(context);
                  return similarProvider.isLoading
                      ? SizedBox(
                          height: screenHeight * .5,
                          child: Widgets.loading(screenHeight, screenWidth))
                      : SizedBox(
                          height: screenHeight * .5,
                          child: OurListView('MORE LIKE THIS', true,
                              similarProvider.similar!));
                }),
          ],
        ),
      ),
    );
  }
}
