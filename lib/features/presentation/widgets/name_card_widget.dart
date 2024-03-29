import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/utils/data_format_utils.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';

class NameCardWidget extends StatelessWidget {
  const NameCardWidget({super.key});

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
        minHeight: 330,
        minWidth: 510,
      ),
      child: Card(
          color: Theme.of(context).colorScheme.cardColor,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state.weatherStatus == WeatherStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.weatherStatus == WeatherStatus.loaded) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 54,
                    ),
                    Text(
                      state.weatherModel!.city!.name!,
                      style: const TextStyle(
                        fontFamily: 'Popins',
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      DataFormatUtils.getTime(state.weatherModel!),
                      style: const TextStyle(
                        height: 1,
                        fontFamily: 'Popins',
                        fontWeight: FontWeight.w700,
                        fontSize: 96,
                      ),
                    ),
                    Text(
                      DataFormatUtils.weekAndDay(state.weatherModel!),
                      style: const TextStyle(
                        fontFamily: 'Popins',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
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
          )),
    );
  }
}
