import 'package:flutter/material.dart';
import 'package:mov/model/movies.dart';
import 'package:mov/app_theme.dart';
import 'package:mov/view_model/categoryMovies.dart';
import 'package:provider/provider.dart';

import '../widgets/search_results.dart';
import '../widgets/loading.dart';

class CategoryMoviesScreen extends StatelessWidget {
  final String name;
  const CategoryMoviesScreen(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name.toUpperCase()), centerTitle: true),
      backgroundColor: AppTheme.primary,
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
