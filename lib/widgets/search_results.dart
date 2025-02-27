import 'package:flutter/material.dart';

import 'package:mov/Model/response.dart';
import 'package:mov/assets/functions.dart';
import 'package:mov/myThemeData.dart';
import 'package:mov/views/movie_details.dart';
import 'package:mov/widgets/detailsCard.dart';
import '../views/animation/offset.dart';

class SearchResults extends StatefulWidget {
  final List<Movie>? movieList;
  final bool isScrollable = true;
  const SearchResults(this.movieList, {super.key});
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: ListView.separated(
        separatorBuilder:
            (context, index) =>
                Divider(color: MyThemeData.accent, thickness: 1),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimatedOffset(
            begin: Offset(index % 2 == 0 ? -1 : 1, 0),
            end: Offset.zero,
            child: InkWell(
              onTap: () {
                goto(
                  context: context,
                  screen: MoreLikeThis(widget.movieList![index]),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenWidth * .035,
                  bottom: screenWidth * .035,
                  left: screenWidth * .05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //photo//
                    SizedBox(
                      width: screenWidth * .4,
                      height: screenHeight * .25,
                      child: MovieDetailsCard(
                        widget.movieList![index],
                        showDetails: false,
                      ),
                    ),

                    ///details//
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ///movie name///
                        SizedBox(
                          width: screenWidth * .5,
                          child: Text(
                            widget.movieList![index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyThemeData.white60,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * .01),

                        /// year ///
                        Text(
                          widget.movieList![index].releaseDate,
                          style: TextStyle(
                            color: MyThemeData.white60,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: screenHeight * .01),
                        Text(
                          widget.movieList![0].adult
                              ? 'adult only'
                              : 'watch with family',
                          style: TextStyle(
                            color: MyThemeData.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: widget.movieList!.length,
      ),
    );
  }
}
