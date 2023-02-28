import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie/widgets.dart/cached_img.dart';

import '../../Model/response.dart';

class MovieCover extends StatelessWidget {
  final Movie movie;
  MovieCover({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
        height: screenHeight * .25,
        width: screenWidth,
        child: CachedImg(
            path: 'https://image.tmdb.org/t/p/original/${movie.backdropPath}'));
  }
}
