import 'package:flutter/material.dart';
import 'package:mov/views/animation/obacity.dart';
import '../../Model/response.dart';
import '../../myThemeData.dart';

class MovieOriginalLanguage extends StatelessWidget {
  final Movie movie;

  const MovieOriginalLanguage({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimateOpacity(
      duration: Duration(seconds: 1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * .05),
          border: Border.all(color: MyThemeData.accent),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * .04),
          child: Text(
            movie.originalLanguage.displayName,
            style: TextStyle(color: MyThemeData.mediumGray),
          ),
        ),
      ),
    );
  }
}
