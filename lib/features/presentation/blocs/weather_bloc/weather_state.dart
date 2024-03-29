import 'package:equatable/equatable.dart';
import 'package:weather_web/features/data/models/weather_model/list_model.dart';
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
  final List<ListModel> listModelOneDay;
  final List<ListModel> listModelFiveDays;
  final WeatherModel? weatherModel;
  final WeatherModel? weatherDaysModel;
  final WeatherStatus weatherStatus;
  final WeatherDaysStatus weatherDaysStatus;
  final String? errorMessage;

  const WeatherState({
    this.weatherStatus = WeatherStatus.initial,
    this.weatherDaysStatus = WeatherDaysStatus.initial,
    this.weatherModel,
    this.errorMessage,
    this.weatherDaysModel,
    this.listModelOneDay = const [],
    this.listModelFiveDays = const [],
  });
  WeatherState copyWith({
    final WeatherModel? weatherDaysModel,
    final WeatherModel? weatherModel,
    final WeatherStatus? weatherStatus,
    final String? errorMessage,
    final WeatherDaysStatus? weatherDaysStatus,
    final List<ListModel>? listModelOneDay,
    final List<ListModel>? listModelFiveDays,
  }) {
    return WeatherState(
      weatherModel: weatherModel ?? this.weatherModel,
      weatherStatus: weatherStatus ?? this.weatherStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      weatherDaysModel: weatherDaysModel ?? this.weatherDaysModel,
      weatherDaysStatus: weatherDaysStatus ?? this.weatherDaysStatus,
      listModelOneDay: listModelOneDay ?? this.listModelOneDay,
      listModelFiveDays: listModelFiveDays ?? this.listModelFiveDays,
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
        listModelFiveDays,
        listModelOneDay,
      ];
}
