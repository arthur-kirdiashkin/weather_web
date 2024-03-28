import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_web/common/constants.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

class MainIconPropertiesWidget extends StatelessWidget {

  final WeatherModel weatherModel;

   const MainIconPropertiesWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getLottieIcons(
                weatherModel.list![0].weather![0].main!, 220, 220) ??
            Image.network(
              NOT_IMAGE_URL,
              width: 220,
              height: 220,
            ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${weatherModel.list![0].weather![0].main}',
          style: const TextStyle(
            fontFamily: 'Popins',
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        )
      ],
    );
  }
}

Widget? getLottieIcons(String icon, [double width = 60, double height = 60]) {
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
