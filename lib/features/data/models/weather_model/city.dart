import 'coord.dart';

class City {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        name: json['name'],
        coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
        country: json['country'],
        population: json['population'],
        timezone: json['timezone'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
}
