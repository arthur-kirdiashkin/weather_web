import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget? getIcons(String icon, [double width = 60, double height = 60]) {
  switch (icon) {
    case 'Clouds':
      return SvgPicture.asset(
        'assets/icons_two/cloudy.svg',
        width: width,
        height: height,
      );
    case 'Clear':
      return SvgPicture.asset(
        'assets/icons_two/sun.svg',
        width: width,
        height: height,
      );
    case 'Drizzle':
      return SvgPicture.asset(
        'assets/icons_two/drizzle.svg',
        width: width,
        height: height,
      );
    case 'Rain':
      return SvgPicture.asset(
        'assets/icons_two/rain.svg',
        width: width,
        height: height,
      );
    case 'Snow':
      return SvgPicture.asset(
        'assets/icons_two/snow.svg',
        width: width,
        height: height,
      );
  }
}