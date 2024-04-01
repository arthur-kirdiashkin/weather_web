import 'package:weather_web/features/data/models/weather_model/general_data.dart';
import 'package:weather_web/features/data/models/weather_model/temp.dart';
import 'package:weather_web/features/data/models/weather_model/weather.dart';
import 'package:weather_web/features/data/models/weather_model/wind.dart';

class ListWeatherData {
  final int? dateTime;
  final GeneralData? generalData;
  final Weather? weather;
  final Temp? temp;
  final Wind? wind;

  ListWeatherData({
    required this.temp,
    required this.dateTime,
    required this.generalData,
    required this.weather,
    required this.wind,
  });

  factory ListWeatherData.fromJson(Map<String, dynamic> json) =>
      ListWeatherData(
        temp: json["temp"] != null ? Temp.fromJson(json["temp"]) : null,
        dateTime: json['dt'],
        generalData:
            json['main'] != null ? GeneralData.fromJson(json['main']) : null,
        weather: Weather.fromJson(json["weather"][0]),
        wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      );
}
