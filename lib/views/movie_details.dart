import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/view_model/moviesDetails.dart';
import 'package:mov/widgets/movie_details/movie_details.dart';
import 'package:mov/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../myThemeData.dart';
import '../widgets/our_list_view.dart';

class MoreLikeThis extends StatelessWidget {
  final Movie movie;
  const MoreLikeThis(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.primary,
        title: Text(movie.title.toUpperCase()),
        centerTitle: true,
      ),
      backgroundColor: MyThemeData.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //cover img
            MovieDetails(movie: movie),
            ChangeNotifierProvider(
              create: (context) => MoviesDetailsVM(movie.id),
              builder: (context, child) {
                final MoviesDetailsVM similarProvider = Provider.of(context);
                return similarProvider.isLoading
                    ? SizedBox(height: screenHeight * .5, child: Loading())
                    : SizedBox(
                      height: screenHeight * .5,
                      child: MoviesListView(
                        name: 'MORE LIKE THIS',
                        needDetails: true,
                        movies: similarProvider.similar!,
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
