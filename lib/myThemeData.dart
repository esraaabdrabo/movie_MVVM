import 'package:flutter/material.dart';

class MyThemeData {
  static Color detText = Color(0xff7f7f7f);
  static Color primary = Color(0xff131313); //#464545
  static Color accent = Color(0xff464545);
  static Color clicked = Color(0xffd79e33);
  static Color text = Colors.white60;
  static ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: MyThemeData.primary, secondary: MyThemeData.accent));
}
