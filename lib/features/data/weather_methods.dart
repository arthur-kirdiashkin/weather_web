import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> isSetDark(bool value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool("is_dark", value);
}

Future<bool> isGetDark() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("is_dark") ?? false;
}

Future<WeatherModel?> getWeatherPath(String cityName, String path) async {
    final parameters = {
      'appid': '1369dd6b5ae78fc9952261ab9aa236b4',
      'q': cityName,
      'units': 'metric',
      'cnt': '5',
    };
    final uri = Uri.https(
      'api.openweathermap.org',
      path,
      parameters,
    );

    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }