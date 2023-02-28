import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color detText = Color(0xff7f7f7f);
  static Color primary = Color(0xff131313); //#464545
  static Color accent = Color(0xff464545);
  static Color clicked = Color(0xffd79e33);
  static Color text = Colors.white60;
  static ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: MyThemeData.primary, secondary: MyThemeData.accent));
  static bigTitleTS({required double w}) {
    return GoogleFonts.aBeeZee(
        textStyle: TextStyle(
            fontSize: w * .055,
            letterSpacing: 1,
            shadows: [
              BoxShadow(
                  color: MyThemeData.accent,
                  blurRadius: 2,
                  offset: Offset(2, 3))
            ],
            color: Color.fromARGB(190, 255, 255, 255),
            fontWeight: FontWeight.w600));
  }

  static midTitleTS({required double w}) {
    return GoogleFonts.aBeeZee(
        textStyle: TextStyle(
            fontSize: w * .04,
            letterSpacing: 1,
            shadows: [
              BoxShadow(
                  color: MyThemeData.accent,
                  blurRadius: 2,
                  offset: Offset(2, 3))
            ],
            color: Color.fromARGB(150, 255, 255, 255),
            fontWeight: FontWeight.w200));
  }
}
