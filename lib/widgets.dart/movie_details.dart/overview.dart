import 'package:flutter/material.dart';

import '../../Model/response.dart';
import '../../myThemeData.dart';
import '../../views/animation/obacity.dart';

class OverView extends StatelessWidget {
  final Movie movie;
  OverView({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return AnimateOpacity(
      duration: Duration(seconds: 2),
      child: SizedBox(
        width: screenWidth * .4,
        height: screenHeight * .18,
        child: ListView(shrinkWrap: true, children: [
          Text(
            movie.overview,
            overflow: TextOverflow.clip,
            style: TextStyle(color: MyThemeData.detText, fontSize: 10),
          ),
        ]),
      ),
    );
  }
}
