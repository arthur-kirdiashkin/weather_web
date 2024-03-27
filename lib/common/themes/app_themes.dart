import 'package:flutter/material.dart';

enum AppThemes {
  lightTheme,
  darkTheme,
}

final appThemData = {
  AppThemes.darkTheme: ThemeData.dark().copyWith(
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      
    ),
  ),
  AppThemes.lightTheme: ThemeData.light()
};

extension CustomColorSchemeX on ColorScheme {
  Color get cardColor => brightness == Brightness.light
      ? Color.fromRGBO(217, 217, 217, 0.8)
      : Color.fromRGBO(68, 68, 68, 0.5);
  Color get iconColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;
  Color get cardDayColor => brightness == Brightness.light
      ? Color.fromRGBO(248, 133, 8, 1)
      : Color.fromRGBO(55, 54, 54, 1);
  Color get cardNightColor => brightness == Brightness.light
      ? Color.fromRGBO(68, 61, 100, 1)
      : Color.fromRGBO(55, 54, 54, 1);
  Color get cardNightGradientColor => brightness == Brightness.light
      ? Color.fromRGBO(101, 130, 198, 0)
      : Color.fromRGBO(55, 54, 54, 1);
  Color get cardDayGradientColor => brightness == Brightness.light
      ? Color.fromRGBO(246, 250, 217, 0)
      : Color.fromRGBO(55, 54, 54, 1);
}
