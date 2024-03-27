import 'package:weather_web/features/data/models/weather_model/clouds.dart';
import 'package:weather_web/features/data/models/weather_model/main.dart';
import 'package:weather_web/features/data/models/weather_model/rain.dart';
import 'package:weather_web/features/data/models/weather_model/sys.dart';
import 'package:weather_web/features/data/models/weather_model/weather.dart';
import 'package:weather_web/features/data/models/weather_model/wind.dart';

class ListModel {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Sys? sys;
  final String? dtTxt;
  final Rain? rain;

  ListModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    required this.rain,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        dt: json['dt'],
        main: json['main'] != null ? Main.fromJson(json['main']) : null,
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
        wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
        visibility: json['visibility'],
        pop: json['pop'].toDouble(),
        sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
        dtTxt: json['dt_txt'],
        rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      );
}
