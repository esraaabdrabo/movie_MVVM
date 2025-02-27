import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/view_model/categoryMovies.dart';
import 'package:provider/provider.dart';

import '../myThemeData.dart';
import '../widgets/search_results.dart';
import '../widgets/loading.dart';

class CategoryMovies extends StatelessWidget {
  final String name;
  const CategoryMovies(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name.toUpperCase()), centerTitle: true),
      backgroundColor: MyThemeData.primary,
      body: ChangeNotifierProvider(
        create: (context) => CategoryMoviesVM(name),
        builder: (context, child) {
          final CategoryMoviesVM categoryMoviesProvider = Provider.of(context);
          final List<Movie>? movies = categoryMoviesProvider.categoryMovies;
          return categoryMoviesProvider.isLoading
              ? Loading()
              : SearchResults(movies);
        },
      ),
    );
  }
}
