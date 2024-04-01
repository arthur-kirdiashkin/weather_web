import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';
import 'package:weather_web/features/presentation/widgets/properties_card_widget/icons_properties_widget.dart';
import 'package:weather_web/features/presentation/widgets/properties_card_widget/main_icon_properties_widget.dart';
import 'package:weather_web/features/presentation/widgets/properties_card_widget/temperature_properties_widget.dart';

class PropertiesCardWidget extends StatelessWidget {
  const PropertiesCardWidget({super.key});

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
              offset: const Offset(10, 10)),
        ],
      ),
      constraints: const BoxConstraints(
        minHeight: 330,
        minWidth: 780,
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
                return Padding(
                  padding: const EdgeInsets.only(left: 24, top: 26),
                  child: Row(
                    children: [
                      TemperaturePropertiesWidget(
                        currentData: state.currentData,
                        city: state.city!,
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      MainIconPropertiesWidget(
                        currentWeather: state.currentDesciptionWeather,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      IconsPropertiesWidget(
                        currentWindSpeed: state.currentWindSpeed,
                        currentData: state.currentData,
                      ),
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
          )),
    );
  }
}
