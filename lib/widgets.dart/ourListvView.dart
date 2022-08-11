import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/myThemeData.dart';

import 'package:movie/widgets.dart/detailsCard.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';

class OurListView extends StatefulWidget {
  String name;
  bool needDetails;
  List<movie?> moviedetails;
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
      color: MyThemeData.accent,
      child: Column(
        children: [
          /////////space between name and upper side of container/////////
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .01),
          ),
          ////////list view name ////////////////////
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: screenWidth * .02)),
              Text('${widget.name}',
                  style: TextStyle(
                    color: MyThemeData.text,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 25,
                  )),
            ],
          ),
          //////////////space between name and cards//////////////
          Padding(padding: EdgeInsets.only(top: screenHeight * .02)),
          ////////list view/////////////////
          Expanded(
            //height: screenHeight * .35,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return widget.needDetails
                    ? Container(
                        height: screenHeight * .1,
                        child: detailsCard(
                          widget.moviedetails[index]!.id,
                          widget.moviedetails[index]!.releaseDate,
                          widget.moviedetails[index]!.posterPath,
                          this.widget.moviedetails[index]!,
                          widget.moviedetails[index]!.title,
                          widget.moviedetails[index]!.voteAverage,
                        ),
                      )
                    : noDetailsCard(widget.moviedetails[index]!);
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
