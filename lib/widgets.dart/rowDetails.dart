import 'package:flutter/material.dart';

import 'package:movie/dataModel/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/views/movieDetailsa.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';

class rowDetails extends StatefulWidget {
  List<movie>? movieList;

  rowDetails(this.movieList);
  @override
  _rowDetailsState createState() => _rowDetailsState();
}

class _rowDetailsState extends State<rowDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
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
                          padding: const EdgeInsets.only(top: 35),
                          child: Row(
                            children: [
                              ///////photo////////////
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * .45,
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  child:
                                      noDetailsCard(widget.movieList![index])),
                              SizedBox(
                                  // width: 20,
                                  ),
                              ////////details////////////
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///movie name////////
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: Text(
                                      '${widget.movieList![index].title}',
                                      style: TextStyle(
                                          color: MyThemeData.text,
                                          fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //////// year /////////////
                                  Text(
                                    '${widget.movieList![index].releaseDate}',
                                    style: TextStyle(
                                        color: MyThemeData.text, fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
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
                              /*          SizedBox(
                                height: 0,
                              )
                    */
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
            ,
            SizedBox(
              height: 15,
            ),
            //////spacer /////////////
          ],
        ),
      ),
    );
  }
}
