import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_event.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: appThemData[AppThemes.lightTheme]!)) {
    on<ThemeChangedEvent>(_themeChangedEvent);
  }

  _themeChangedEvent(ThemeChangedEvent event, emit) async {
    final bool isDarkTheme = await isDark();
    //  emit(state.copyWith(weatherStatus: WeatherStatus.loaded, weatherModel: getWeather));
    if (isDarkTheme) {
      final myTheme = appThemData[AppThemes.darkTheme];
      emit(state.copyWith(
        themeStatus: ThemeStatus.changed,
        themeData: myTheme,
      ));
    } else {
      final myTheme = appThemData[AppThemes.lightTheme];
      emit(state.copyWith(
        themeStatus: ThemeStatus.changedOff,
        themeData: myTheme,
      ));
      // emit(ChangedOffThemeState(themeData: myTheme!));
    }
  }
}

Future<bool> isDark() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("is_dark") ?? false;
}
