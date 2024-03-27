import 'package:flutter/material.dart';

enum AppThemes {
  LightTheme,
  DarkTheme,
}

// class MyColors {
//   final Color? cardColor;
//   final Color? iconColor;

//   MyColors({required this.cardColor, required this.iconColor});
// }

// class MyColors extends ThemeExtension<MyColors> {
//   const MyColors({
//     required this.cardColor,
//     required this.iconColor,
//   });

//   final Color? cardColor;
//   final Color? iconColor;

//   @override
//   MyColors copyWith({Color? cardColor, Color? danger}) {
//     return MyColors(
//       cardColor: cardColor ?? cardColor,
//       iconColor: iconColor ?? iconColor,
//     );
//   }

//   @override
//   ThemeExtension<MyColors> lerp(
//       covariant ThemeExtension<MyColors>? other, double t) {
//     if (other is! MyColors) {
//       return this;
//     }
//     return MyColors(
//       cardColor: Color.lerp(cardColor, other.cardColor, t),
//       iconColor: Color.lerp(iconColor, other.iconColor, t),
//     );
//   }

//   @override
//   String toString() => 'MyColors(cardColor: $cardColor, iconColor: $iconColor)';
// }

final appThemData = {
  AppThemes.DarkTheme: ThemeData.dark(),
  AppThemes.LightTheme: ThemeData.light()
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
