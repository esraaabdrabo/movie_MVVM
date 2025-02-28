import 'package:flutter/material.dart';
import 'package:mov/app_theme.dart';
import 'package:mov/assets/constants/img.dart';

import 'package:mov/view_model/search.dart';
import 'package:mov/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../widgets/search_results.dart';
import '../animation/app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => SearchVM(),
      builder: (context, child) {
        final SearchVM searchProvider = Provider.of(context);
        return searchProvider.isLoading
            ? Loading()
            : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: .05 * screenHeight),
                child: Column(
                  children: [
                    AnimatedAppBar(maxHeight: screenHeight * .1),

                    //search field
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        //search bar//
                        children: [
                          TextField(
                            onSubmitted: (value) {
                              searchProvider.getSearchedMovies(value);
                            },
                            style: TextStyle(color: AppTheme.white60),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              focusColor: AppTheme.white60,
                              filled: true,
                              fillColor: AppTheme.accent,
                              hoverColor: AppTheme.white60,
                              hintText: 'SEARCH WITH MOVIE NAME',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .05,
                          ),
                        ],
                      ),
                    ),
                    if (searchProvider.isSearchUsed)
                      searchProvider.searchedMovies.isEmpty
                          ? Image.asset(ConstantsIMG.notFoundPath)
                          : SearchResults(searchProvider.searchedMovies),
                  ],
                ),
              ),
            );
      },
    );
  }
}
