class Weather {
  final String? descriptionWeather;

  Weather({
    required this.descriptionWeather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        descriptionWeather: json['main'],
      );
}
