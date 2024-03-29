import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:lottie/lottie.dart';
import 'package:weather_web/common/constants.dart';

class MethodUtils {
  static Widget? getIcons(String icon,
      [double width = 60, double height = 60]) {
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

  static Widget? getWindIcons(int wind,
      [double width = 60, double height = 60]) {
    if (0 < wind && wind < 90) {
      return Image.asset('assets/icons_two/navigation 1.png');
    } else if (90 < wind && wind < 180) {
      return Transform.rotate(
          angle: 30 * math.pi / 180,
          child: Image.asset('assets/icons_two/navigation 1.png'));
    } else {
      return Transform.rotate(
          angle: 330 * math.pi / 180,
          child: Image.asset('assets/icons_two/navigation 1.png'));
    }
  }

  static Widget? getLottieIcons(String icon,
      [double width = 60, double height = 60]) {
    switch (icon) {
      case 'Clouds':
        return Lottie.network(
          LOTTIE_IMAGE_CLOUDS,
          width: width,
          height: height,
          animate: true,
          repeat: true,
        );
      case 'Clear':
        return Lottie.network(
          LOTTIE_IMAGE_CLEAR,
          width: width,
          height: height,
          animate: true,
          repeat: true,
        );
      case 'Drizzle':
        return Lottie.network(
          LOTTIE_IMAGE_DRIZZLE,
          width: width,
          height: height,
          animate: true,
          repeat: true,
        );
      case 'Rain':
        return Lottie.network(
          LOTTIE_IMAGE_RAIN,
          width: width,
          height: height,
          animate: true,
          repeat: true,
        );
      case 'Snow':
        return Lottie.network(
          LOTTIE_IMAGE_SNOW,
          width: width,
          height: height,
          animate: true,
          repeat: true,
        );
    }
  }
}
