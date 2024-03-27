import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_state.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_event.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_event.dart';
import 'package:weather_web/features/presentation/pages/home_page.dart';
import 'package:weather_web/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<ThemeBloc>()),
          BlocProvider(
              create: (context) => locator<WeatherDaysBloc>()
                ..add(GetWeatherDaysEvent(cityName: 'London'))),
          BlocProvider(
              create: (context) => locator<WeatherBloc>()
                ..add(GetWeatherEvent(cityName: 'London')))
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state.themeStatus == ThemeStatus.initial) {
              return MaterialApp(
                theme: state.themeData,
                home: HomePage(),
              );
            } else if (state.themeStatus == ThemeStatus.changed) {
              return MaterialApp(
                theme: state.themeData,
                home: HomePage(),
              );
            }
            return SizedBox.shrink();
          },
        ));
  }
}
