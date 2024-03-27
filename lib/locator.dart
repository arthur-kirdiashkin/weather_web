import 'package:get_it/get_it.dart';
import 'package:weather_web/features/data/repository/weather_repository.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> initDependency() async {
  locator
      .registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());

  locator.registerFactory(
      () => WeatherBloc(weatherRepository: locator<WeatherRepository>()));

  locator.registerFactory(
      () => WeatherDaysBloc(weatherRepository: locator<WeatherRepository>()));

      locator.registerFactory(() => ThemeBloc());
}
