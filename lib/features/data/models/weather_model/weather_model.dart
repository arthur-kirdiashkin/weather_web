import 'package:weather_web/features/data/models/weather_model/city.dart';
import 'package:weather_web/features/data/models/weather_model/list_weather_data.dart';

class WeatherModel {
  final List<ListWeatherData>? listWeatherData;
  final City? city;

  WeatherModel({
    required this.listWeatherData,
    required this.city,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        listWeatherData: List<ListWeatherData>.from(
            json["list"].map((x) => ListWeatherData.fromJson(x))),
        city: json['city'] != null ? City.fromJson(json['city']) : null,
      );
}
