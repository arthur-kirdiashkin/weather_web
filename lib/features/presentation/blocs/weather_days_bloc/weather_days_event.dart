import 'package:equatable/equatable.dart';

abstract class WeatherDaysEvent extends Equatable {}

class GetWeatherDaysEvent extends WeatherDaysEvent {
  final String cityName;

  GetWeatherDaysEvent({
    required this.cityName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cityName];
}