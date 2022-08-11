import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';

class detailsCard extends StatefulWidget {
  int id;
  String year, imgPath, movieName;
  double rate;
  movie Movie;

  detailsCard(
      this.id, this.year, this.imgPath, this.Movie, this.movieName, this.rate);
  @override
  _detailsCardState createState() => _detailsCardState();
}

class _detailsCardState extends State<detailsCard> {
  bool needPaddingDetailsCard = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('click details');
      },
      child: Padding(
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .05,
            left: MediaQuery.of(context).size.width * .05),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyThemeData.accent,
              boxShadow: [
                BoxShadow(color: MyThemeData.detText, blurRadius: 5)
              ]),
          width: MediaQuery.of(context).size.width * .4,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    noDetailsCard(
                      widget.Movie,
                      needPaddingDetailsCard,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ////////rating//////////////

                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: MyThemeData.text,
                                size: 15,
                              ),
                              Padding(padding: EdgeInsets.only(left: 3.0)),
                              Text(
                                '${widget.rate.ceilToDouble()}',
                                style: TextStyle(
                                    color: MyThemeData.text, fontSize: 12),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          //////////////moviename////////////////////

                          Text(
                            '${widget.movieName}',
                            style: TextStyle(
                                color: MyThemeData.detText,
                                letterSpacing: 2,
                                fontSize: 10),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          ///////////year//////////////////////////

                          Text(
                            '${widget.year}',
                            style: TextStyle(
                                color: MyThemeData.detText,
                                letterSpacing: 2,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
