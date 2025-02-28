import 'package:flutter/material.dart';
import 'package:mov/widgets/cached_img.dart';

import '../../model/movies.dart';

class MovieCover extends StatelessWidget {
  final Movie movie;
  const MovieCover({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * .25,
      width: screenWidth,
      child: CachedImg(
        // TODO: just handle the full path while parsing from json.
        path: 'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
      ),
    );
  }
}
