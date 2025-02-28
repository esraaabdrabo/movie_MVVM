import 'package:flutter/material.dart';
import 'package:mov/model/enums/language_code.dart';
import 'package:mov/model/movies.dart';
import 'package:mov/animation/obacity.dart';
import 'package:mov/app_theme.dart';

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
          border: Border.all(color: AppTheme.accent),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * .04),
          child: Text(
            movie.originalLanguage.displayName,
            style: TextStyle(color: AppTheme.mediumGray),
          ),
        ),
      ),
    );
  }
}
