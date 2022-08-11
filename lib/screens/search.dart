/*import 'package:flutter/material.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/view_model/seacrh.dart';
import 'package:movie/widgets.dart/futureBuilderSearch.dart';
import 'package:provider/provider.dart';

import '../widgets.dart/rowDetails.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchVM(),
        builder: (context, child) {
          SearchVM searchProvider = Provider.of(context);
          return SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  //search field
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      /////////search bar////////////
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
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                      ],
                    ),
                  ),
                  !searchProvider.isSearchUsed
                      ? Container()
                      : searchProvider.searchedMovies!.length == 0
                          ? Image.asset(
                              'images/searchNotFound.jpg',
                              //     width: MediaQuery.of(context).size.height * .25,
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return rowDetails(
                                      searchProvider.searchedMovies);
                                },
                                itemCount: 1,
                              ),
                            )
                ],
              ),
            ),
          );
        });
  }
}
*/