import 'package:flutter/material.dart';
import 'package:mov/assets/constants/img.dart';
import 'package:mov/myThemeData.dart';
import 'package:mov/view_model/search.dart';
import 'package:mov/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../widgets/search_results.dart';
import '../animation/app_bar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => SearchVM(),
      builder: (context, child) {
        SearchVM searchProvider = Provider.of(context);
        return searchProvider.isLoading
            ? Loading()
            : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: .05 * screenHeight),
                child: Column(
                  children: [
                    AnimatedAppBar(end: screenHeight * .1),

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
                            style: TextStyle(color: MyThemeData.white60),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              focusColor: MyThemeData.white60,
                              filled: true,
                              fillColor: MyThemeData.accent,
                              hoverColor: MyThemeData.white60,
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
                      searchProvider.searchedMovies!.isEmpty
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
