import 'package:flutter/material.dart';
import 'package:movie/views/animation/offset.dart';

import '../../Model/response.dart';
import '../../myThemeData.dart';

class TitleAndDate extends StatelessWidget {
  final Movie movie;
  TitleAndDate({required this.movie, Key? key}) : super(key: key);

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
            style: TextStyle(color: MyThemeData.text),
          ),
          SizedBox(
            height: screenHeight * .01,
          ),
          //under cover date//
          Text(
            movie.releaseDate,
            style: TextStyle(color: MyThemeData.detText),
          ),
          SizedBox(
            height: screenHeight * .02,
          ),
        ],
      ),
    );
  }
}
