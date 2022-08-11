import 'package:flutter/material.dart';
import 'package:movie/dataModel/response.dart';
import 'package:movie/view_model/moviesDetails.dart';
import 'package:provider/provider.dart';
import '../myThemeData.dart';
import '../widgets.dart/noDetailsCard.dart';
import '../widgets.dart/ourListvView.dart';

class MovieDetails extends StatelessWidget {
  movie clickedMovie;
  MovieDetails(this.clickedMovie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String languageCompleteWord() {
      String movieLanguage = clickedMovie.originalLanguage;
      return 'language : ${movieLanguage == 'es' ? 'spanish' : movieLanguage == 'en' ? 'english' : movieLanguage == 'hi' ? 'hindi' : movieLanguage == 'ar' ? 'arabic' : movieLanguage == 'fa' ? 'persian' : movieLanguage == 'fr' ? 'french' : movieLanguage} ';
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.primary,
        title: Text(
          ' ${clickedMovie.title}'.toUpperCase(),
        ),
        centerTitle: true,
      ),
      backgroundColor: MyThemeData.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //cover img
            Image.network(
              'https://image.tmdb.org/t/p/original/${clickedMovie.backdropPath}',
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenWidth * .05, bottom: screenWidth * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /////under cover title///////
                  Text(
                    '${clickedMovie.title}',
                    style: TextStyle(color: MyThemeData.text),
                  ),
                  SizedBox(
                    height: screenHeight * .01,
                  ),
                  /////under cover date///////
                  Text(
                    '${clickedMovie.releaseDate}',
                    style: TextStyle(color: MyThemeData.detText),
                  ),
                  SizedBox(
                    height: screenHeight * .02,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      noDetailsCard(clickedMovie),
                      Column(
                        children: [
                          ///////////language box///////////////
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * .05),
                                border: Border.all(color: MyThemeData.accent)),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * .04),
                              child: Text(
                                languageCompleteWord(),
                                style: TextStyle(color: MyThemeData.detText),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * .02,
                          ),

                          ///////over view/////////////////////
                          Container(
                            width: screenWidth * .4,
                            child: Text(
                              '${clickedMovie.overview}',
                              style: TextStyle(
                                  color: MyThemeData.detText, fontSize: 10),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * .01,
                          ),

                          ////////////vote icon and number ////////////
                          Container(
                            width: screenWidth * .4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: MyThemeData.clicked,
                                  size: screenWidth * .04,
                                ),
                                SizedBox(
                                  width: screenWidth * .02,
                                ),
                                Text(
                                    '${clickedMovie.voteAverage.ceilToDouble()}',
                                    style: TextStyle(
                                        color: MyThemeData.detText,
                                        fontSize: 12))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            ChangeNotifierProvider(
                create: (context) => MoviesDetailsVM(clickedMovie.id),
                builder: (context, child) {
                  MoviesDetailsVM similarProvider = Provider.of(context);
                  return SizedBox(
                      height: screenHeight * .5,
                      child: OurListView(
                          'MORE LIKE THIS', true, similarProvider.similar!));
                }),
          ],
        ),
      ),
    );
  }
}
