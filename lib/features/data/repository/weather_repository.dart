import 'package:weather_web/common/constants.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';
import 'package:weather_web/features/data/weather_methods.dart';

abstract class WeatherRepository {
  Future<WeatherModel?> getWeather(String cityName);
  Future<WeatherModel?> getDaysWeather(String cityName);
}

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherModel?> getDaysWeather(String cityName) =>
      getWeatherPath(cityName, GET_WEATHER_DAYS_PATH);

  @override
  Future<WeatherModel?> getWeather(String cityName) =>
      getWeatherPath(cityName, GET_WEATHER_PATH);
}
