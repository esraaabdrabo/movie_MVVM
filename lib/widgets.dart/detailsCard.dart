import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';

class DetailsCard extends StatefulWidget {
  int id;
  String year, imgPath, movieName;
  double rate;
  Movie movie;

  DetailsCard(
      this.id, this.year, this.imgPath, this.movie, this.movieName, this.rate);
  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  bool needPaddingDetailsCard = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .05,
              left: MediaQuery.of(context).size.width * .05),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyThemeData.accent,
            ),
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      noDetailsCard(
                        widget.movie,
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
                                  color: MyThemeData.clicked,
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
                              widget.movieName,
                              overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
