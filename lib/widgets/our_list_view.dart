import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/myThemeData.dart';
import 'package:mov/views/animation/offset.dart';
import 'package:mov/widgets/detailsCard.dart';

class MoviesListView extends StatefulWidget {
  final String name;
  final bool needDetails;
  final List<Movie?> movies;
  const MoviesListView({
    super.key,
    required this.name,
    required this.needDetails,
    required this.movies,
  });

  @override
  State<MoviesListView> createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyThemeData.accent.withAlpha(10),
            Color.fromARGB(54, 255, 255, 255),
          ],
        ),
      ),
      child: Column(
        children: [
          AnimatedOffset(
            begin: Offset(0, 1),
            end: Offset.zero,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * .05),
              child: Text(widget.name, style: TextStyles.bigTitle(screenWidth)),
            ),
          ),

          //list view//
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AnimatedOffset(
                  begin: Offset(5, 2),
                  end: Offset.zero,
                  child: MovieDetailsCard(
                    widget.movies[index]!,
                    showDetails: widget.needDetails,
                  ),
                );
              },
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
