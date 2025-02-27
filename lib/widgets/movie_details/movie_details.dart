import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/views/animation/offset.dart';
import 'package:mov/widgets/detailsCard.dart';
import '../../view_model/homeBody.dart';
import 'language.dart';
import 'most_popular_now.dart';
import 'not_popular_cover.dart';
import 'overview.dart';
import 'title_and_date.dart';
import 'vote_and_rate.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  final HomeBodyVM? homeProvider;
  final bool containMostPopular;
  const MovieDetails({
    required this.movie,
    this.containMostPopular = false,
    this.homeProvider,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        //most popular cover
        containMostPopular
            ? MostPopularNow(movie: movie)
            : MovieCover(movie: movie),
        Padding(
          padding: EdgeInsets.only(
            top: screenWidth * .05,
            bottom: screenWidth * .05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleAndDate(movie: movie),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOffset(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                    child: MovieDetailsCard(movie, showDetails: false),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        //language box//
                        MovieOriginalLanguage(movie: movie),
                        SizedBox(height: screenHeight * .02),

                        //over view//
                        MovieOverView(movie: movie),
                        SizedBox(height: screenHeight * .01),

                        //vote icon and number //
                        VoteAndRate(movie: movie),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
