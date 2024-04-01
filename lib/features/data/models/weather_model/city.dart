class City {
  final String? name;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  City({
    required this.name,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json['name'],
        timezone: json['timezone'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
}
