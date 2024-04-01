import 'package:equatable/equatable.dart';
import 'package:weather_web/features/data/models/weather_model/city.dart';
import 'package:weather_web/features/data/models/weather_model/list_weather_data.dart';
import 'package:weather_web/features/data/models/weather_model/general_data.dart';
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
  final List<ListWeatherData> listModelOneDay;
  final List<ListWeatherData> listModelFiveDays;
  final WeatherModel? weatherModel;
  final WeatherModel? weatherDaysModel;
  final WeatherStatus weatherStatus;
  final WeatherDaysStatus weatherDaysStatus;
  final String? errorMessage;
  final List<GeneralData?> listGeneralData;
  final City? city;
  final int? dt;
  final List<Wind?> listWindForOneDay;
  final List<Weather?> listWeatherOneDay;
  final List<Weather?> listWeatherFiveDays;
  final List<Temp?> listTemp;
  final GeneralData? currentData;
  final Wind? currentWindSpeed;
  final Weather? currentDesciptionWeather;

  const WeatherState({
    this.currentDesciptionWeather,
    this.currentWindSpeed,
    this.currentData,
    this.listWeatherFiveDays = const [],
    this.listTemp = const [],
    this.listWeatherOneDay = const [],
    this.listWindForOneDay = const [],
    this.dt,
    this.city,
    this.listGeneralData = const [],
    this.weatherStatus = WeatherStatus.initial,
    this.weatherDaysStatus = WeatherDaysStatus.initial,
    this.weatherModel,
    this.errorMessage,
    this.weatherDaysModel,
    this.listModelOneDay = const [],
    this.listModelFiveDays = const [],
  });
  WeatherState copyWith({
    final Weather? currentDesciptionWeather,
    final Wind? currentWindSpeed,
    final GeneralData? currentData,
    final List<Temp?>? listTemp,
    final List<Weather?>? listWeatherFiveDays,
    final List<Weather?>? listWeatherOneDay,
    final int? dt,
    final List<GeneralData?>? listGeneralData,
    final WeatherModel? weatherDaysModel,
    final WeatherModel? weatherModel,
    final WeatherStatus? weatherStatus,
    final String? errorMessage,
    final WeatherDaysStatus? weatherDaysStatus,
    final List<ListWeatherData>? listModelOneDay,
    final List<ListWeatherData>? listModelFiveDays,
    final City? city,
    final List<Wind?>? listWindForOneDay,
  }) {
    return WeatherState(
      currentDesciptionWeather:
          currentDesciptionWeather ?? this.currentDesciptionWeather,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      listTemp: listTemp ?? this.listTemp,
      listWeatherFiveDays: listWeatherFiveDays ?? this.listWeatherFiveDays,
      listWeatherOneDay: listWeatherOneDay ?? this.listWeatherOneDay,
      listWindForOneDay: listWindForOneDay ?? this.listWindForOneDay,
      dt: dt ?? this.dt,
      city: city ?? this.city,
      listGeneralData: listGeneralData ?? this.listGeneralData,
      weatherModel: weatherModel ?? this.weatherModel,
      weatherStatus: weatherStatus ?? this.weatherStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      weatherDaysModel: weatherDaysModel ?? this.weatherDaysModel,
      weatherDaysStatus: weatherDaysStatus ?? this.weatherDaysStatus,
      listModelOneDay: listModelOneDay ?? this.listModelOneDay,
      listModelFiveDays: listModelFiveDays ?? this.listModelFiveDays,
      currentData: currentData ?? this.currentData,
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
        listGeneralData,
        dt,
        city,
        listWindForOneDay,
        listWeatherOneDay,
        listTemp,
        listWeatherFiveDays,
        currentData,
        currentWindSpeed,
        currentDesciptionWeather,
      ];
}
