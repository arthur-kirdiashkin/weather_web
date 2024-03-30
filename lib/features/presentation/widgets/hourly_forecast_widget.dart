import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/common/constants.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/utils/data_format_utils.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';
import 'package:weather_web/features/presentation/utils/methods_utils.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(10, 10)),
      ]),
      constraints: const BoxConstraints(
        maxHeight: 366,
        maxWidth: 835,
      ),
      child: Card(
        color: Theme.of(context).colorScheme.cardColor,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.weatherStatus == WeatherStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.weatherStatus == WeatherStatus.loaded) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Text(
                        'Hourly Forecast:',
                        style: TextStyle(
                          fontFamily: 'Popins',
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.listModelOneDay.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0, 1],
                                  colors: (DataFormatUtils.colorsCard(
                                          state.listModelOneDay[index].dt!))
                                      ? <Color>[
                                          Theme.of(context)
                                              .colorScheme
                                              .cardDayColor,
                                          Theme.of(context)
                                              .colorScheme
                                              .cardDayGradientColor
                                        ]
                                      : <Color>[
                                          Theme.of(context)
                                              .colorScheme
                                              .cardNightColor,
                                          Theme.of(context)
                                              .colorScheme
                                              .cardNightGradientColor
                                        ]),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            constraints: const BoxConstraints(
                              minHeight: 250,
                              minWidth: 130,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  DataFormatUtils.timeInHours(
                                      state.listModelOneDay[index].dt!),
                                  style: const TextStyle(
                                    fontFamily: 'Popins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                MethodUtils.getIcons(
                                        state.listWeather[index]!.first.main!,
                                        80,
                                        80) ??
                                    Image.network(
                                      NOT_IMAGE_URL,
                                      width: 60,
                                      height: 60,
                                    ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${state.listMain[index]!.temp!.toInt()}°C',
                                  style: const TextStyle(
                                    fontFamily: 'Popins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                MethodUtils.getWindIcons(
                                    state.listWindForOneDay[index]!.deg!)!,
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  '${state.listWindForOneDay[index]!.speed!.ceil()}km/h',
                                  style: const TextStyle(
                                    fontFamily: 'Popins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            } else if (state.weatherStatus == WeatherStatus.error) {
              return const Center(
                child: Text(
                  'Ошибка передачи данных',
                  style: TextStyle(fontSize: 40),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
