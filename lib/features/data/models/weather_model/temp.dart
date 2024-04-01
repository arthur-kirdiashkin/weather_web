class Temp {
  final double? day;

  Temp({
    required this.day,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"]?.toDouble(),
      );
}
