import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/widgets/movie_details/not_popular_cover.dart';
import '../../myThemeData.dart';

class MostPopularNow extends StatelessWidget {
  final Movie movie;
  const MostPopularNow({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        MovieCover(movie: movie),
        SizedBox(
          width: screenWidth * .6,
          height: screenHeight * .08,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MyThemeData.golden.withAlpha(150),
                      MyThemeData.accent.withAlpha(110),
                      Color.fromARGB(120, 255, 255, 255),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(screenWidth * .05),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'most popular now',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyles.midTitle(screenWidth),
                    ),
                    Icon(
                      Icons.star_half_rounded,
                      size: screenWidth * .08,
                      color: Color.fromARGB(255, 247, 200, 72),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
