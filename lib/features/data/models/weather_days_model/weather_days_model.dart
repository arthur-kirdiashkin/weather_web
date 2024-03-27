import 'dart:convert';
import 'package:weather_web/features/data/models/weather_days_model/city.dart';
import 'package:weather_web/features/data/models/weather_days_model/list_element.dart';

class WeatherDaysModel {
  final City? city;
  final String? cod;
  final double? message;
  final int? cnt;
  final List<ListElement>? list;

  WeatherDaysModel({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  factory WeatherDaysModel.fromJson(Map<String, dynamic> json) =>
      WeatherDaysModel(
        city: City.fromJson(json["city"]),
        cod: json["cod"],
        message: json["message"]?.toDouble(),
        cnt: json["cnt"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city!.toJson(),
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}
