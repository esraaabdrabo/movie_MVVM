import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/view_model/categoryMovies.dart';
import 'package:provider/provider.dart';

import '../myThemeData.dart';
import '../widgets.dart/search_results.dart';
import '../widgets.dart/loading.dart';

// ignore: must_be_immutable
class CategoryMovies extends StatelessWidget {
  String name;
  CategoryMovies(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$name'.toUpperCase()),
          centerTitle: true,
        ),
        backgroundColor: MyThemeData.primary,
        body: ChangeNotifierProvider(
            create: (context) => CategoryMoviesVM(name),
            builder: (context, child) {
              CategoryMoviesVM categoryMoviesProvider = Provider.of(context);
              List<Movie>? movies = categoryMoviesProvider.categoryMovies;
              return categoryMoviesProvider.isLoading
                  ? Loading()
                  : SearchResults(movies);
            }));
  }
}
