import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_event.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_state.dart';
import 'package:weather_web/features/presentation/widgets/methods_widget.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          themeData: appThemData[AppThemes.lightTheme]!,
        )) {
    on<ThemeChangedEvent>(_themeChangedEvent);
  }

  _themeChangedEvent(ThemeChangedEvent event, emit) async {
    await isSetDark(event.isDark);

    final bool isDarkTheme = await isGetDark();

    final ThemeData? myTheme;

    if (isDarkTheme) {
      myTheme = appThemData[AppThemes.darkTheme];
    } else {
      myTheme = appThemData[AppThemes.lightTheme];
    }
    emit(
      state.copyWith(
        isDark: event.isDark,
        themeStatus: ThemeStatus.changed,
        themeData: myTheme,
      ),
    );
  }
}
