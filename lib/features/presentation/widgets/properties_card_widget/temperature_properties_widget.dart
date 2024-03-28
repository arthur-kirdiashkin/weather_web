import 'package:flutter/material.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

class TemperaturePropertiesWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const TemperaturePropertiesWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weatherModel.list![0].main!.temp!.ceil()}°C',
          style: const TextStyle(
            height: 1,
            fontFamily: 'Popins',
            fontWeight: FontWeight.w700,
            fontSize: 80,
          ),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Feels like:',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.iconColor,
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
            TextSpan(
                text: ' ${weatherModel!.list![0].main!.feelsLike!.ceil()}',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.iconColor,
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w600,
                    fontSize: 32)),
            TextSpan(
              text: '°C',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.iconColor,
                  fontFamily: 'Popins',
                  fontWeight: FontWeight.w700,
                  fontSize: 32),
            )
          ]),
        ),
        const SizedBox(
          height: 27,
        ),
        Row(
          children: [
            Image.asset(
              'assets/icons/sunrise-white 1.png',
              color: Theme.of(context).colorScheme.iconColor,
            ),
            const SizedBox(
              width: 11,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sunrice',
                  style: TextStyle(
                      fontFamily: 'Popins',
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                Text(
                  '${getClockInUtcPlus3Hours(weatherModel.city!.sunrise!)}',
                  style: const TextStyle(
                      fontFamily: 'Popins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Image.asset(
              'assets/icons/sunset-white 1.png',
              color: Theme.of(context).colorScheme.iconColor,
            ),
            const SizedBox(
              width: 11,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sunrset',
                  style: TextStyle(
                      fontFamily: 'Popins',
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                Text(
                  '${getClockInUtcPlus3Hours(weatherModel!.city!.sunset!)}',
                  style: const TextStyle(
                      fontFamily: 'Popins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

String? getClockInUtcPlus3Hours(int timeSinceEpochInSec) {
  final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
          isUtc: true)
      .add(const Duration(hours: 3));
  return '${time.hour}:${time.second} AM';
}
