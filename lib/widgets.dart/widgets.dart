import 'package:flutter/material.dart';
import 'package:movie/Model/response.dart';
import 'package:movie/view_model/homeBody.dart';

import '../myThemeData.dart';
import 'noDetailsCard.dart';

class Widgets {
  static loading(double screenHeight, double screenWidth) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WAIT .',
            style: TextStyle(color: Colors.white, fontSize: screenWidth * .1),
          ),
          SizedBox(
            height: screenHeight * .03,
          ),
          SizedBox(
            height: screenHeight * .01,
            width: screenWidth * .6,
            child: LinearProgressIndicator(color: MyThemeData.clicked),
          ),
        ],
      ),
    );
  }

  static Widget movieDetails(
      double screenHeight, double screenWidth, Movie movie,
      [HomeBodyVM? homeProvider, bool containMosstPopular = false]) {
    String languageCompleteWord(String movieLanguage) {
      return 'language : ${movieLanguage == 'es' ? 'spanish' : movieLanguage == 'en' ? 'english' : movieLanguage == 'hi' ? 'hindi' : movieLanguage == 'ar' ? 'arabic' : movieLanguage == 'fa' ? 'persian' : movieLanguage == 'fr' ? 'french' : movieLanguage} ';
    }

    Container mostPopularCover() {
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: screenHeight * .1,
              alignment: Alignment.center,
              padding: EdgeInsets.all(screenWidth * .05),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  MyThemeData.clicked,
                  MyThemeData.accent.withAlpha(110),
                  Color.fromARGB(156, 255, 255, 255)
                ]),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(screenWidth * .05),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'most popular now ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenWidth * .035,
                        letterSpacing: 1,
                        color: Color.fromARGB(218, 255, 255, 255),
                        fontWeight: FontWeight.w300),
                  ),
                  Icon(Icons.star_half_rounded,
                      size: screenWidth * .1,
                      color: Color.fromARGB(255, 247, 200, 72))
                ],
              ),
            ),
          ],
        ),
        width: screenWidth,
        height: screenHeight * .3,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                ))),
      );
    }

    SizedBox notPopularCover() {
      return SizedBox(
        height: screenHeight * .25,
        width: screenWidth,
        child: Image.network(
          'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
          fit: BoxFit.fill,
        ),
      );
    }

    Column titleAndDate() {
      return Column(
        children: [
          /////under cover title///////
          Text(
            movie.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemeData.text),
          ),
          SizedBox(
            height: screenHeight * .01,
          ),
          /////under cover date///////
          Text(
            movie.releaseDate,
            style: TextStyle(color: MyThemeData.detText),
          ),
          SizedBox(
            height: screenHeight * .02,
          ),
        ],
      );
    }

    Container langContainer() {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * .05),
            border: Border.all(color: MyThemeData.accent)),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * .04),
          child: Text(
            languageCompleteWord(movie.originalLanguage),
            style: TextStyle(color: MyThemeData.detText),
          ),
        ),
      );
    }

    Container overViewContainer() {
      return Container(
        width: screenWidth * .4,
        height: screenHeight * .18,
        child: ListView(shrinkWrap: true, children: [
          Text(
            movie.overview,
            overflow: TextOverflow.clip,
            style: TextStyle(color: MyThemeData.detText, fontSize: 10),
          ),
        ]),
      );
    }

    Container voteAndRate() {
      return Container(
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
            Text('${movie.voteAverage.ceilToDouble()}',
                style: TextStyle(color: MyThemeData.detText, fontSize: 12))
          ],
        ),
      );
    }

    return Column(
      children: [
        //most popular cover
        containMosstPopular ? mostPopularCover() : notPopularCover(),
        Padding(
          padding: EdgeInsets.only(
              top: screenWidth * .05, bottom: screenWidth * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleAndDate(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  noDetailsCard(
                    movie,
                  ),
                  Column(
                    children: [
                      ///////////language box///////////////
                      langContainer(),
                      SizedBox(
                        height: screenHeight * .02,
                      ),

                      ///////over view/////////////////////
                      overViewContainer(),
                      SizedBox(
                        height: screenHeight * .01,
                      ),

                      ////////////vote icon and number ////////////
                      voteAndRate()
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
