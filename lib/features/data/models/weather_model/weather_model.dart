import 'package:weather_web/features/data/models/weather_model/city.dart';
import 'package:weather_web/features/data/models/weather_model/list_model.dart';

class WeatherModel {
  final String? cod;
  final double? message;
  final int? cnt;
  final List<ListModel>? list;
  final City? city;

  WeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cod: json['cod'],
        message: json['message'].toDouble(),
        cnt: json['cnt'],
        list: List<ListModel>.from(
            json["list"].map((x) => ListModel.fromJson(x))),
        city: json['city'] != null ? City.fromJson(json['city']) : null,
      );
}
