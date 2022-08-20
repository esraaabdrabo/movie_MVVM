import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/view_model/categoryMovies.dart';
import 'package:provider/provider.dart';

import '../myThemeData.dart';
import '../widgets.dart/rowDetails.dart';
import '../widgets.dart/widgets.dart';

// ignore: must_be_immutable
class CategoryMovies extends StatelessWidget {
  String name;
  CategoryMovies(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                  ? Widgets.loading(screenHeight, screenWidth)
                  : rowDetails(movies);
            }));
  }
}
