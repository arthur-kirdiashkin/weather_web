import 'package:equatable/equatable.dart';
import 'package:weather_web/features/data/models/weather_model/city.dart';
import 'package:weather_web/features/data/models/weather_model/list_model.dart';
import 'package:weather_web/features/data/models/weather_model/main.dart';
import 'package:weather_web/features/data/models/weather_model/temp.dart';
import 'package:weather_web/features/data/models/weather_model/weather.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';
import 'package:weather_web/features/data/models/weather_model/wind.dart';

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
  final List<Main?> listMain;
  final City? city;
  final int? dt;
  final List<Wind?> listWindForOneDay;
  final List<List<Weather>?> listWeather;
  final List<Temp?> listTemp;

  const WeatherState({
    this.listTemp = const [],
    this.listWeather = const [],
    this.listWindForOneDay = const [],
    this.dt,
    this.city,
    this.listMain = const [],
    this.weatherStatus = WeatherStatus.initial,
    this.weatherDaysStatus = WeatherDaysStatus.initial,
    this.weatherModel,
    this.errorMessage,
    this.weatherDaysModel,
    this.listModelOneDay = const [],
    this.listModelFiveDays = const [],
  });
  WeatherState copyWith({
    final List<Temp?>? listTemp,
    final List<List<Weather>?>? listWeather,
    final int? dt,
    final List<Main?>? listMain,
    final WeatherModel? weatherDaysModel,
    final WeatherModel? weatherModel,
    final WeatherStatus? weatherStatus,
    final String? errorMessage,
    final WeatherDaysStatus? weatherDaysStatus,
    final List<ListModel>? listModelOneDay,
    final List<ListModel>? listModelFiveDays,
    final City? city,
    final List<Wind?>? listWindForOneDay,
  }) {
    return WeatherState(
      listTemp: listTemp ?? this.listTemp,
      listWeather: listWeather ?? this.listWeather,
      listWindForOneDay: listWindForOneDay ?? this.listWindForOneDay,
      dt: dt ?? this.dt,
      city: city ?? this.city,
      listMain: listMain ?? this.listMain,
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
        listMain,
        dt,
        city,
        listWindForOneDay,
        listWeather,
        listTemp,
      ];
}
