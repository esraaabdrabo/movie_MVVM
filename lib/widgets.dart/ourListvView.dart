import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/views/animation/offset.dart';
import 'package:movie/widgets.dart/detailsCard.dart';
import 'package:movie/widgets.dart/noDetailsCard.dart';

class OurListView extends StatefulWidget {
  final String name;
  final bool needDetails;
  final List<Movie?> moviedetails;
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
          MyThemeData.accent.withAlpha(10),
          Color.fromARGB(54, 255, 255, 255)
        ]),
      ),
      child: Column(
        children: [
          AnimatedOffset(
            begin: Offset(0, 1),
            end: Offset.zero,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * .05),
              child: Text(widget.name,
                  style: MyThemeData.bigTitleTS(w: screenWidth)),
            ),
          ),

          //list view//
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AnimatedOffset(
                    begin: Offset(5, 2),
                    end: Offset.zero,
                    child: widget.needDetails
                        ? DetailsCard(
                            widget.moviedetails[index]!.id,
                            widget.moviedetails[index]!.releaseDate,
                            widget.moviedetails[index]!.posterPath,
                            this.widget.moviedetails[index]!,
                            widget.moviedetails[index]!.title,
                            widget.moviedetails[index]!.voteAverage,
                          )
                        : NoDetailsCard(
                            widget.moviedetails[index]!,
                          ));
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
