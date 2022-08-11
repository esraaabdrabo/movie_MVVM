import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/widgets.dart/rowDetails.dart';

class moviesCategory extends StatefulWidget {
  String name;
  moviesCategory(this.name);
  @override
  State<moviesCategory> createState() => _moviesCategoryState();
}

class _moviesCategoryState extends State<moviesCategory> {
  late List<movie> movieList;
  Future<List<movie>?>? futureMovieListOfCategory;
  /*Future<List<movie>?> getMovieCategories(String categoryName) {
    return futureMovieListOfCategory = PopularSV.getMovieList(
        'https://api.themoviedb.org/3/discover/movie?api_key=36dac39aff2bc256201415d1f2d33cdf&with_genres=${categoryName}');
  }

  @override
  void initState() {
    super.initState();
    print('${widget.name}');
    futureMovieListOfCategory = getMovieCategories('${widget.name}');
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}'.toUpperCase()),
        centerTitle: true,
      ),
      backgroundColor: MyThemeData.primary,
      body: FutureBuilder(
          future: futureMovieListOfCategory,
          builder:
              (BuildContext context, AsyncSnapshot<List<movie>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('error ${snapshot.connectionState}');
              } else if (snapshot.hasData) {
                print('has datat');
                movieList = snapshot.data!;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return rowDetails(movieList);
                  },
                  itemCount: 1,
                );
              }
            }
            return Text('');
          }),
    );
  }
}
