import 'package:flutter/material.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

class IconsPropertiesWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const IconsPropertiesWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/icons_two/humidity.png',
                  color: Theme.of(context).colorScheme.iconColor,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  '${weatherModel.list![0].main!.humidity}%',
                  style: const TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  'Humidity',
                  style: TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/icons_two/wind.png',
                  color: Theme.of(context).colorScheme.iconColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${weatherModel.list![0].wind!.speed!.ceil()}km/h',
                  style: const TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  'Wind Speed',
                  style: TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        Row(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/icons_two/pressure.png',
                  color: Theme.of(context).colorScheme.iconColor,
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  '${weatherModel.list![0].main!.pressure}hPa',
                  style: const TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  'Pressure',
                  style: TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 55,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/icons_two/sealevel.png',
                  color: Theme.of(context).colorScheme.iconColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${weatherModel.list![0].main!.seaLevel}',
                  style: const TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  'Sea level',
                  style: TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
