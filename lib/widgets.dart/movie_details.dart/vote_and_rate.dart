import 'package:flutter/material.dart';
import 'package:movie/views/animation/offset.dart';

import '../../Model/response.dart';
import '../../myThemeData.dart';

class VoteAndRate extends StatelessWidget {
  final Movie movie;
  VoteAndRate({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return AnimatedOffset(
        begin: Offset(5, 5),
        end: Offset.zero,
        child: SizedBox(
          width: screenWidth * .4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: MyThemeData.clicked,
                size: screenWidth * .04,
              ),
              SizedBox(
                width: screenWidth * .02,
              ),
              Text('${movie.voteAverage.ceilToDouble()}',
                  style: TextStyle(color: MyThemeData.detText, fontSize: 12))
            ],
          ),
        ));
  }
}
