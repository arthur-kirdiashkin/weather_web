import 'package:equatable/equatable.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

enum WeatherStatus { loaded, loading, error, initial }

class WeatherState extends Equatable {
  final WeatherModel? weatherModel;
  final WeatherStatus weatherStatus;
  final String? errorMessage;

  WeatherState(
      {this.weatherStatus = WeatherStatus.initial,
      this.weatherModel,
      this.errorMessage});
  WeatherState copyWith({
    final WeatherModel? weatherModel,
    final WeatherStatus? weatherStatus,
    final String? errorMessage,
  }) {
    return WeatherState(
      weatherModel: weatherModel ?? this.weatherModel,
      weatherStatus: weatherStatus ?? this.weatherStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [weatherStatus];
}
