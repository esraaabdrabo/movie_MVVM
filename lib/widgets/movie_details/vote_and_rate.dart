import 'package:flutter/material.dart';
import 'package:mov/app_theme.dart';
import 'package:mov/animation/offset.dart';

import '../../model/movies.dart';

class VoteAndRate extends StatelessWidget {
  final Movie movie;
  const VoteAndRate({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedOffset(
      begin: Offset(5, 5),
      end: Offset.zero,
      child: SizedBox(
        width: screenWidth * .4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.star, color: AppTheme.golden, size: screenWidth * .04),
            SizedBox(width: screenWidth * .02),
            Text(
              '${movie.voteAverage.ceilToDouble()}',
              style: TextStyle(color: AppTheme.mediumGray, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
