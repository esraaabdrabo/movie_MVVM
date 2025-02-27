import 'package:flutter/material.dart';

import '../../Model/response.dart';
import '../../myThemeData.dart';
import '../../views/animation/obacity.dart';

class MovieOverView extends StatelessWidget {
  final Movie movie;
  const MovieOverView({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimateOpacity(
      duration: Duration(seconds: 2),
      child: SizedBox(
        width: screenWidth * .4,
        height: screenHeight * .18,
        // TODO WHY NOT USING SINGLE CHILE SCROLL VIEW
        child: ListView(shrinkWrap: true, children: [
          Text(
            movie.overview,
            overflow: TextOverflow.clip,
            style: TextStyle(color: MyThemeData.mediumGray, fontSize: 10),
          ),
        ]),
      ),
    );
  }
}
