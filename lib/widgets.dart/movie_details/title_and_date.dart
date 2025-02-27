import 'package:flutter/material.dart';
import 'package:mov/views/animation/offset.dart';

import '../../Model/response.dart';
import '../../myThemeData.dart';

class TitleAndDate extends StatelessWidget {
  final Movie movie;
  const TitleAndDate({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return AnimatedOffset(
      begin: Offset(10, 0),
      end: Offset.zero,
      child: Column(
        children: [
          //under cover title//
          Text(
            movie.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemeData.white60),
          ),
          SizedBox(height: screenHeight * .01),
          //under cover date//
          Text(
            movie.releaseDate,
            style: TextStyle(color: MyThemeData.mediumGray),
          ),
          SizedBox(height: screenHeight * .02),
        ],
      ),
    );
  }
}
