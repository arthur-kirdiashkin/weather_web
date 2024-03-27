import 'package:weather_web/features/data/models/weather_days_model/feels_like.dart';
import 'package:weather_web/features/data/models/weather_days_model/temp.dart';
import 'package:weather_web/features/data/models/weather_days_model/weather.dart';

class ListElement {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final Temp? temp;
  final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  final List<Weather>? weather;
  final double? speed;
  final int? deg;
  final double? gust;
  final int? clouds;
  final double? pop;
  final double? rain;

  ListElement({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.pop,
    this.rain,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
        clouds: json["clouds"],
        pop: json["pop"]?.toDouble(),
        rain: json["rain"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp!.toJson(),
        "feels_like": feelsLike!.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
        "speed": speed,
        "deg": deg,
        "gust": gust,
        "clouds": clouds,
        "pop": pop,
        "rain": rain,
      };
}