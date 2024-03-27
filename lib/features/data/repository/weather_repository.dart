import 'dart:convert';

import 'package:weather_web/features/data/models/weather_days_model/weather_days_model.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRepository {
  Future<WeatherModel?> getWeather(String cityName);
  Future<WeatherDaysModel?> getDaysWeather(String cityName);
}

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherModel?> getWeather(String cityName) async {
    final parameters = {
      'appid': 'd355bc452190b3e266cf8d4932aa64d6',
      'q': cityName,
      'units': 'metric',
      'cnt': '5',
    };

    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/forecast/',
      parameters,
    );

    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<WeatherDaysModel?> getDaysWeather(String cityName) async {
     final parameters = {
      'appid': '1369dd6b5ae78fc9952261ab9aa236b4',
      'q': cityName,
      'units': 'metric',
      'cnt': '5',
    };

    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/forecast/daily/',
      parameters,
    );

    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        return WeatherDaysModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
