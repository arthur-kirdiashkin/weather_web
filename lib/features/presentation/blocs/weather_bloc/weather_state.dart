import 'package:equatable/equatable.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

enum WeatherStatus {
  loaded,
  loading,
  error,
  initial,
  loadedDays,
}

enum WeatherDaysStatus {
  initial,
  loadedDays,
  loading,
  error,
}

class WeatherState extends Equatable {
  final WeatherModel? weatherModel;
  final WeatherModel? weatherDaysModel;
  final WeatherStatus weatherStatus;
  final WeatherDaysStatus weatherDaysStatus;
  final String? errorMessage;

  WeatherState({
    this.weatherStatus = WeatherStatus.initial,
    this.weatherDaysStatus = WeatherDaysStatus.initial,
    this.weatherModel,
    this.errorMessage,
    this.weatherDaysModel,
  });
  WeatherState copyWith(
      {final WeatherModel? weatherDaysModel,
      final WeatherModel? weatherModel,
      final WeatherStatus? weatherStatus,
      final String? errorMessage,
      final WeatherDaysStatus? weatherDaysStatus}) {
    return WeatherState(
      weatherModel: weatherModel ?? this.weatherModel,
      weatherStatus: weatherStatus ?? this.weatherStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      weatherDaysModel: weatherDaysModel ?? this.weatherDaysModel,
      weatherDaysStatus: weatherDaysStatus ?? this.weatherDaysStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        weatherStatus,
        weatherModel,
        errorMessage,
        weatherDaysModel,
        weatherDaysStatus,
      ];
}
