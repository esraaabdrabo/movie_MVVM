import 'package:flutter/material.dart';
import 'package:movie/myThemeData.dart';
import 'package:movie/view_model/seacrh.dart';
import 'package:movie/widgets.dart/widgets.dart';
import 'package:provider/provider.dart';
import '../../widgets.dart/rowDetails.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchVM(),
        builder: (context, child) {
          double screenHeight = MediaQuery.of(context).size.height;
          double screenWidth = MediaQuery.of(context).size.width;
          SearchVM searchProvider = Provider.of(context);
          return searchProvider.isLoading
              ? Widgets.loading(screenHeight, screenWidth)
              : SingleChildScrollView(
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
                                height:
                                    MediaQuery.of(context).size.height * .05,
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
