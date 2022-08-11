import 'package:flutter/material.dart';
import 'package:movie/view_model/categoryMovies.dart';
import 'package:provider/provider.dart';

import '../myThemeData.dart';
import '../widgets.dart/rowDetails.dart';

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
              return ListView.builder(
                itemBuilder: (context, index) {
                  return rowDetails(categoryMoviesProvider.categoryMovies);
                },
                itemCount: 1,
              );
            }));
  }
}
