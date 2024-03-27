class Coord {
  final double? lat;
  final double? lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json['lat'],
        lon: json['lon'],
      );
}