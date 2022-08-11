import 'package:flutter/material.dart';
import 'package:movie/services/movieDataBase.dart';
import 'package:movie/dataModel/category.dart';
import 'package:movie/widgets.dart/futureBuilderCategory.dart';

class browse extends StatefulWidget {
  @override
  _browseState createState() => _browseState();
}

class _browseState extends State<browse> {
  late Future<List<category>?> futureCategoryList;

  /* Future<List<category>?> getCategories() {
    return PopularSV.getCategoryList(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=36dac39aff2bc256201415d1f2d33cdf');
  }

  @override
  initState() {
    super.initState();
    futureCategoryList = getCategories();
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(child: futureBuilderCategory(futureCategoryList)),
          ],
        ));
  }
}
