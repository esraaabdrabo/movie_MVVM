import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/widgets.dart/unused_videoPlayer.dart';

import 'ourListvView.dart';

class ourFutureBuilder extends StatefulWidget {
  List<movie>? futuerMovieList;
  String listViewName;
  bool needDetails;
  ourFutureBuilder(this.futuerMovieList, this.listViewName, this.needDetails);
  @override
  State<ourFutureBuilder> createState() => _ourFutureBuilderState();
}

class _ourFutureBuilderState extends State<ourFutureBuilder> {
  List<movie?> movieList = [];
  @override
  Widget build(BuildContext context) {
    return Container();
    /* FutureBuilder(
        future: widget.futuerMovieList,
        builder: (BuildContext context, AsyncSnapshot<List<movie>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Column(
              children: [
                CircularProgressIndicator(),
                Image.asset('images/search.jpg'),
              ],
            ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print('error');
            } else if (snapshot.hasData) {
              movieList = snapshot.data!;
              return ourListView(
                      widget.listViewName, widget.needDetails, movieList);
            
            }
          }
          return Text('${snapshot.connectionState}');
        });
  */
  }
}
