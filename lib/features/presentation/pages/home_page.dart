import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_event.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_state.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_event.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_event.dart';
import 'package:weather_web/features/presentation/widgets/days_forecast_widget.dart';
import 'package:weather_web/features/presentation/widgets/hourly_forecast_widget.dart';
import 'package:weather_web/features/presentation/widgets/name_card_widget.dart';
import 'package:weather_web/features/presentation/widgets/properties_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cityController = TextEditingController();
  bool isDark = false;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 78.99),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 63,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Switch(
                        thumbColor: MaterialStatePropertyAll(Colors.black),
                        trackColor: MaterialStatePropertyAll(
                          Color.fromRGBO(217, 217, 217, 1),
                        ),
                        activeColor: Colors.black,
                        activeTrackColor: Color.fromRGBO(217, 217, 217, 1),
                        value: isDark,
                        onChanged: (value) async {
                          prefs = await SharedPreferences.getInstance();
                          setState(() {
                            isDark = !isDark;
                          });
                          prefs.setBool("is_dark", isDark);
                          context
                              .read<ThemeBloc>()
                              .add(ThemeChangedEvent(isDark: isDark));
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        isDark == false ? 'Light Mode' : 'Dark Mode',
                        style: TextStyle(
                          color: isDark == false ? Colors.black : Colors.white,
                          fontFamily: 'Popins',
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 78,
                  ),
                  SizedBox(
                    width: 800,
                    height: 62,
                    child: TextField(
                      controller: cityController,
                      onSubmitted: (value) {
                        context.read<WeatherBloc>().add(
                            GetWeatherEvent(cityName: cityController.text));
                        context.read<WeatherDaysBloc>().add(
                            GetWeatherDaysEvent(cityName: cityController.text));
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: 'Search for your preffered city...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: Icon(Icons.zoom_in)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 49,
              ),
              const Row(
                children: [
                  NameCardWidget(),
                  SizedBox(
                    width: 55,
                  ),
                  PropertiesCardWidget(),
                ],
              ),
              SizedBox(
                height: 49,
              ),
              Row(
                children: [
                  DaysForecastWidget(),
                  SizedBox(
                    width: 55,
                  ),
                  HourlyForecastWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
