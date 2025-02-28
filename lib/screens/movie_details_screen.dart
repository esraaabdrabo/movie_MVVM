import 'package:flutter/material.dart';
import 'package:mov/model/movies.dart';
import 'package:mov/app_theme.dart';
import 'package:mov/view_model/moviesDetails.dart';
import 'package:mov/widgets/movie_details/movie_details.dart';
import 'package:mov/widgets/loading.dart';
import 'package:mov/widgets/movie_details_card.dart';
import 'package:provider/provider.dart';
import '../widgets/app_list_view.dart';

class MoreLikeThis extends StatelessWidget {
  final Movie movie;
  const MoreLikeThis(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text(movie.title.toUpperCase()),
        centerTitle: true,
      ),
      backgroundColor: AppTheme.primary,
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
                      child: AppListView<Movie?>(
                        title: 'MORE LIKE THIS',
                        data: similarProvider.similar!,
                        builder:
                            (index) => MovieDetailsCard(
                              similarProvider.similar![index],
                              showDetails: true,
                            ),
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
