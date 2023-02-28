import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/view_model/moviesDetails.dart';
import 'package:movie/widgets.dart/movie_details.dart/movie_details.dart';
import 'package:movie/widgets.dart/loading.dart';
import 'package:provider/provider.dart';
import '../myThemeData.dart';
import '../widgets.dart/ourListvView.dart';

// ignore: must_be_immutable
class MoreLikeThis extends StatelessWidget {
  Movie clickedMovie;
  MoreLikeThis(this.clickedMovie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
           MovieDetails(movie:  clickedMovie),
            ChangeNotifierProvider(
                create: (context) => MoviesDetailsVM(clickedMovie.id),
                builder: (context, child) {
                  MoviesDetailsVM similarProvider = Provider.of(context);
                  return similarProvider.isLoading
                      ? SizedBox(height: screenHeight * .5, child: Loading())
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
