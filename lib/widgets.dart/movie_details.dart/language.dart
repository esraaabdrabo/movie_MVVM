import 'package:flutter/material.dart';
import 'package:movie/views/animation/obacity.dart';
import '../../Model/response.dart';
import '../../myThemeData.dart';

class Language extends StatelessWidget {
  final Movie movie;

  Language({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return AnimateOpacity(
        child: Container(
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
        ),
        duration: Duration(seconds: 1));
  }
}

String languageCompleteWord(String movieLanguage) {
  return 'language : ${movieLanguage == 'es' ? 'spanish' : movieLanguage == 'en' ? 'english' : movieLanguage == 'hi' ? 'hindi' : movieLanguage == 'ar' ? 'arabic' : movieLanguage == 'fa' ? 'persian' : movieLanguage == 'fr' ? 'french' : movieLanguage} ';
}
