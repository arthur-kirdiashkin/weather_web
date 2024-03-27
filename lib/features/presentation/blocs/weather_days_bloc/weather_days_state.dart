import 'package:equatable/equatable.dart';
import 'package:weather_web/features/data/models/weather_days_model/weather_days_model.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

enum WeatherDaysStatus { loaded, loading, error, initial }

class WeatherDaysState extends Equatable {
  final WeatherDaysModel? weatherDaysModel;
  final WeatherDaysStatus weatherDaysStatus;
  final String? errorMessage;

  WeatherDaysState(
      {this.weatherDaysStatus = WeatherDaysStatus.initial,
      this.weatherDaysModel,
      this.errorMessage});
  WeatherDaysState copyWith({
    final WeatherDaysModel? weatherDaysModel,
    final WeatherDaysStatus? weatherDaysStatus,
    final String? errorMessage,
  }) {
    return WeatherDaysState(
      weatherDaysModel: weatherDaysModel ?? this.weatherDaysModel,
      weatherDaysStatus: weatherDaysStatus ?? this.weatherDaysStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [weatherDaysStatus];
}