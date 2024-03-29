import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_web/common/constants.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';
import 'package:weather_web/features/presentation/widgets/days_forecast_widget/get_icons.dart';

import '../../utils/data_format_utils.dart';

class DaysForecastWidget extends StatelessWidget {
  const DaysForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(10, 10),
          ),
        ],
      ),
      constraints: const BoxConstraints(
        minWidth: 450,
        minHeight: 366,
      ),
      child: Card(
          color: Theme.of(context).colorScheme.cardColor,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state.weatherDaysStatus == WeatherDaysStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.weatherDaysStatus ==
                  WeatherDaysStatus.loadedDays) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 20,
                    right: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Center(
                        child: Text(
                          '5 Days Forecast:',
                          style: TextStyle(
                            fontFamily: 'Popins',
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.weatherDaysModel!.list!.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              getIcons(state.weatherDaysModel!.list![index]
                                      .weather![0].main!) ??
                                  Image.network(
                                    NOT_IMAGE_URL,
                                    width: 60,
                                    height: 60,
                                  ),
                              Text(
                                '${state.weatherDaysModel!.list![index].temp!.day!.toInt()}°C',
                                style: const TextStyle(
                                  fontFamily: 'Popins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                DataFormatUtils.weekAndDayFive(
                                    index, state.weatherDaysModel!),
                                style: const TextStyle(
                                  fontFamily: 'Popins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else if (state.weatherDaysStatus == WeatherDaysStatus.error) {
                return const Center(
                  child: Text(
                    'Ошибка передачи данных',
                    style: TextStyle(fontSize: 30),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )),
    );
  }
}
