import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/widgets.dart/detailsCard.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';

class OurListView extends StatefulWidget {
  String name;
  bool needDetails;
  List<Movie?> moviedetails;
  OurListView(this.name, this.needDetails, this.moviedetails);

  @override
  State<OurListView> createState() => _OurListViewState();
}

class _OurListViewState extends State<OurListView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          // MyThemeData.clicked,
          MyThemeData.accent.withAlpha(10),
          Color.fromARGB(54, 255, 255, 255)
        ]),
      )
      // color: MyThemeData.accent,
      ,
      child: Column(
        children: [
          /////////space between name and upper side of container/////////
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .05),
          ),
          ////////list view name ////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name,
                  style: TextStyle(
                    color: MyThemeData.text.withAlpha(100),
                    letterSpacing: 1,
                    fontSize: screenWidth * .05,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .05),
          ),
          //////////////space between name and cards//////////////
          ////////list view/////////////////
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return widget.needDetails
                    ? Column(
                        children: [
                          DetailsCard(
                            widget.moviedetails[index]!.id,
                            widget.moviedetails[index]!.releaseDate,
                            widget.moviedetails[index]!.posterPath,
                            this.widget.moviedetails[index]!,
                            widget.moviedetails[index]!.title,
                            widget.moviedetails[index]!.voteAverage,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          noDetailsCard(
                            widget.moviedetails[index]!,
                          ),
                        ],
                      );
              },
              itemCount: widget.moviedetails.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
