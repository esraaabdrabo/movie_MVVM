import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/widgets.dart/movie_details.dart/not_popular_cover.dart';
import '../../myThemeData.dart';

class MostPopularNow extends StatelessWidget {
  final Movie movie;
  MostPopularNow({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

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
                  gradient: LinearGradient(colors: [
                    MyThemeData.clicked.withAlpha(150),
                    MyThemeData.accent.withAlpha(110),
                    Color.fromARGB(120, 255, 255, 255)
                  ]),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(screenWidth * .05),
                  ),
                ),
                child: Row(
                  children: [
                    Text('most popular now ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: MyThemeData.midTitleTS(w: screenWidth)),
                    Icon(Icons.star_half_rounded,
                        size: screenWidth * .08,
                        color: Color.fromARGB(255, 247, 200, 72))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
