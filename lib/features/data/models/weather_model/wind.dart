class Wind {
  final double? speed;
  final int? windDegrees;

  Wind({
    required this.speed,
    required this.windDegrees,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed'].toDouble(),
        windDegrees: json['deg'],
      );
}
