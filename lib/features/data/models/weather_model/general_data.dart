class GeneralData {
  final double? tempOfOneDay;
  final double? feelsLike;
  final int? pressure;
  final int? seaLevel;
  final int? humidity;

  GeneralData({
    required this.tempOfOneDay,
    required this.feelsLike,
    required this.pressure,
    required this.seaLevel,
    required this.humidity,
  });

  factory GeneralData.fromJson(Map<String, dynamic> json) => GeneralData(
        tempOfOneDay: json['temp'].toDouble(),
        feelsLike: json['feels_like'].toDouble(),
        pressure: json['pressure'],
        seaLevel: json['sea_level'],
        humidity: json['humidity'],
      );
}
