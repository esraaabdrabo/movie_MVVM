import 'package:flutter/material.dart';

import 'package:movie/Model/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/views/movieDetailsa.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';

class rowDetails extends StatefulWidget {
  List<Movie>? movieList;

  rowDetails(this.movieList);
  @override
  _rowDetailsState createState() => _rowDetailsState();
}

class _rowDetailsState extends State<rowDetails> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(
                                  widget.movieList![index],
                                )));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenWidth * .035,
                            bottom: screenWidth * .035,
                            left: screenWidth * .05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///////photo////////////
                            Container(
                                width: screenWidth * .4,
                                height: screenHeight * .25,
                                child: noDetailsCard(
                                    widget.movieList![index], false)),

                            ////////details////////////
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ///movie name////////
                                Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: Text(
                                    widget.movieList![index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: MyThemeData.text, fontSize: 12),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * .01,
                                ),
                                //////// year /////////////
                                Text(
                                  '${widget.movieList![index].releaseDate}',
                                  style: TextStyle(
                                      color: MyThemeData.text, fontSize: 12),
                                ),
                                SizedBox(
                                  height: screenHeight * .01,
                                ),
                                /////adult ot not ////////////
                                widget.movieList![0].adult == false
                                    ? Text(
                                        'watch with family',
                                        style: TextStyle(
                                            color: MyThemeData.text,
                                            fontSize: 12),
                                      )
                                    : Text(
                                        '  adult only',
                                        style: TextStyle(
                                            color: MyThemeData.text,
                                            fontSize: 12),
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),

                      ///space between rows //////
                      SizedBox(
                        height: 0,
                      ),

                      ///gray spacer between rows //////
                      Divider(
                        color: MyThemeData.accent,
                        thickness: 1,
                      ),

                      ///space between rows //////
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
              itemCount: widget.movieList!.length,
            ),
          )
          ///////card ///////////////
        ],
      ),
    );
  }
}
