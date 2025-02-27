import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mov/widgets.dart/cached_img.dart';

import '../../Model/response.dart';

class MovieCover extends StatelessWidget {
  final Movie movie;
  const MovieCover({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * .25,
      width: screenWidth,
      child: CachedImg(
        path: 'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
      ),
    );
  }
}
