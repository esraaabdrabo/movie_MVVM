import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/myThemeData.dart';

import 'package:movie/widgets.dart/detailsCard.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';

class ourListView extends StatefulWidget {
  String name;
  bool needDetails;
  List<movie?> moviedetails;
  ourListView(this.name, this.needDetails, this.moviedetails);

  @override
  State<ourListView> createState() => _ourListViewState();
}

class _ourListViewState extends State<ourListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyThemeData.accent,
      height: !widget.needDetails
          ? MediaQuery.of(context).size.height * .4
          : MediaQuery.of(context).size.height * .5,
      child: Column(
        children: [
          /////////space between name and upper side of container/////////
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
          ),
          ////////list view name ////////////////////
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .02)),
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
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .02)),
          ////////list view/////////////////
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return widget.needDetails
                    ? detailsCard(
                        widget.moviedetails[index]!.id,
                        widget.moviedetails[index]!.releaseDate,
                        widget.moviedetails[index]!.posterPath,
                        this.widget.moviedetails[index]!,
                        widget.moviedetails[index]!.title,
                        widget.moviedetails[index]!.voteAverage,
                      )
                    : noDetailsCard(//moviedetails[index]!.id,
                        // moviedetails[index]!.posterPath,
                        widget.moviedetails[index]!);
              },
              itemCount: widget.moviedetails.length,
              scrollDirection: Axis.horizontal,
            ),
          ),

          widget.needDetails
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                )
              : SizedBox(
                  height: 0,
                )
        ],
      ),
    );
  }
}
