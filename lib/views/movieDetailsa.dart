import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/view_model/moviesDetails.dart';
import 'package:mov/widgets.dart/movie_details/movie_details.dart';
import 'package:mov/widgets.dart/loading.dart';
import 'package:provider/provider.dart';
import '../myThemeData.dart';
import '../widgets.dart/ourListvView.dart';

// ignore: must_be_immutable
class MoreLikeThis extends StatelessWidget {
  Movie goldenMovie;
  MoreLikeThis(this.goldenMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.primary,
        title: Text(' ${goldenMovie.title}'.toUpperCase()),
        centerTitle: true,
      ),
      backgroundColor: MyThemeData.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //cover img
            MovieDetails(movie: goldenMovie),
            ChangeNotifierProvider(
              create: (context) => MoviesDetailsVM(goldenMovie.id),
              builder: (context, child) {
                MoviesDetailsVM similarProvider = Provider.of(context);
                return similarProvider.isLoading
                    ? SizedBox(height: screenHeight * .5, child: Loading())
                    : SizedBox(
                      height: screenHeight * .5,
                      child: OurListView(
                        'MORE LIKE THIS',
                        true,
                        similarProvider.similar!,
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
