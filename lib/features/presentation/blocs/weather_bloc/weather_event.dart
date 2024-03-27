import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;

  GetWeatherEvent({
    required this.cityName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cityName];
}
