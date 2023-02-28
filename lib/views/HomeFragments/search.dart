import 'package:flutter/material.dart';
import 'package:movie/assets/constants/img.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/view_model/seacrh.dart';
import 'package:movie/widgets.dart/loading.dart';
import 'package:provider/provider.dart';
import '../../widgets.dart/search_results.dart';
import '../animation/app_bar.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
                                style: TextStyle(color: MyThemeData.text),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  focusColor: MyThemeData.text,
                                  filled: true,
                                  fillColor: MyThemeData.accent,
                                  hoverColor: MyThemeData.text,
                                  hintText: 'SEARCH WITH MOVIE NAME',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .05,
                              ),
                            ],
                          ),
                        ),
                        !searchProvider.isSearchUsed
                            ? const SizedBox()
                            : searchProvider.searchedMovies!.length == 0
                                ? Image.asset(
                                    ConstantsIMG.notFoundPath,
                                  )
                                : SearchResults(searchProvider.searchedMovies)
                      ],
                    ),
                  ),
                );
        });
  }
}
