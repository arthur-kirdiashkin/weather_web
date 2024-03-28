import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_event.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_event.dart';

class TextFieldWidget extends StatelessWidget {
  final cityController = TextEditingController();
  TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 62,
      child: TextField(
        controller: cityController,
        onSubmitted: (value) {
          context
              .read<WeatherBloc>()
              .add(GetWeatherEvent(cityName: cityController.text));
          context
              .read<WeatherDaysBloc>()
              .add(GetWeatherDaysEvent(cityName: cityController.text));
          cityController.clear();
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20),
            hintText: 'Search for your preffered city...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            prefixIcon: const Icon(Icons.zoom_in)),
      ),
    );
  }
}
