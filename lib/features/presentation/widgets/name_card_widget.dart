import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';

class NameCardWidget extends StatefulWidget {
  const NameCardWidget({super.key});

  @override
  State<NameCardWidget> createState() => _NameCardWidgetState();
}

class _NameCardWidgetState extends State<NameCardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state.weatherStatus == WeatherStatus.loading) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 0.0,
                      offset: const Offset(10, 10)),
                ]),
            width: 510,
            height: 330,
            child: Card(
              color: Theme.of(context).colorScheme.cardColor,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state.weatherStatus == WeatherStatus.loaded) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 0.0,
                      offset: const Offset(10, 10)),
                ]),
            width: 510,
            height: 330,
            child: Card(
              color: Theme.of(context).colorScheme.cardColor,
              // elevation: 3,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
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
                    DateFormat.Hm().format(DateTime.now().add(Duration(
                      seconds: state.weatherModel!.city!.timezone! -
                          DateTime.now().timeZoneOffset.inSeconds,
                    ))),
                    style: const TextStyle(
                      height: 1,
                      fontFamily: 'Popins',
                      fontWeight: FontWeight.w700,
                      fontSize: 96,
                    ),
                  ),
                  Text(
                    DateFormat('EEEE, d MMM').format(DateTime.now().add(Duration(
                      seconds: state.weatherModel!.city!.timezone! -
                          DateTime.now().timeZoneOffset.inSeconds,
                    ))),
                    style: const TextStyle(
                      fontFamily: 'Popins',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state.weatherStatus == WeatherStatus.error) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 0.0,
                  offset: const Offset(10, 20)),
            ]),
            width: 510,
            height: 330,
            child: Card(
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: Text(
                  'Ошибка передачи данных',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
