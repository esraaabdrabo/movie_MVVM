import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/services/movieDataBase.dart';
import 'package:movie/widgets.dart/rowDetails.dart';

class futureBuilderSearch extends StatefulWidget {
  String searchName;
  futureBuilderSearch(this.searchName);

  @override
  State<futureBuilderSearch> createState() => _futureBuilderSearchState();
}

class _futureBuilderSearchState extends State<futureBuilderSearch> {
  Future<List<movie>?>? futureSearchResultList;
  List<movie>? movieList;
  /* Future<List<movie>?> searchMovie(name) async {
    return PopularSV.getMovieList(
        'https://api.themoviedb.org/3/search/movie?api_key=36dac39aff2bc256201415d1f2d33cdf&query=$name');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureSearchResultList = searchMovie(widget.searchName);
  }*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureSearchResultList,
        builder: (BuildContext context, AsyncSnapshot<List<movie>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Image.asset('images/searchNotFound.jpg');
            } else if (snapshot.hasData) {
              movieList = snapshot.data!;
              ///////////if search name not found/////////////////
              if (movieList!.length == 0) {
                return Image.asset(
                  'images/searchNotFound.jpg',
                  //     width: MediaQuery.of(context).size.height * .25,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return rowDetails(movieList);
                },
                itemCount: 1,
              );
            }
          }
          return Image.asset('images/searchNotFound.jpg');
        });
  }
}
