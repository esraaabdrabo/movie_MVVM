import 'package:flutter/material.dart';
import 'package:mov/model/movies.dart';
import 'package:mov/animation/offset.dart';
import 'package:mov/app_theme.dart';

class MovieTitleAndDate extends StatelessWidget {
  final Movie movie;
  const MovieTitleAndDate({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedOffset(
      begin: Offset(10, 0),
      end: Offset.zero,
      child: Column(
        children: [
          //under cover title//
          Text(
            movie.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppTheme.white60),
          ),
          SizedBox(height: screenHeight * .01),
          //under cover date//
          Text(movie.releaseDate, style: TextStyle(color: AppTheme.mediumGray)),
          SizedBox(height: screenHeight * .02),
        ],
      ),
    );
  }
}
