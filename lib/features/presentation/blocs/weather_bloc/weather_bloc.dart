import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/features/data/models/weather_model/main.dart';
import 'package:weather_web/features/data/models/weather_model/temp.dart';
import 'package:weather_web/features/data/models/weather_model/weather.dart';
import 'package:weather_web/features/data/models/weather_model/wind.dart';
import 'package:weather_web/features/data/repository/weather_repository.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_event.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherState()) {
    on<GetWeatherEvent>(_getWeatherEvent);
    on<GetDaysWeatherEvent>(_getDaysWeatherEvent);
  }

  _getWeatherEvent(GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(weatherStatus: WeatherStatus.loading));

    final getWeather = await weatherRepository.getWeather(event.cityName);

    if (getWeather == null) {
      return emit(state.copyWith(weatherStatus: WeatherStatus.error));
    }

    final List<Wind?> listWind = getWeather.list!.map((e) {
      if (e.wind != null) {
        return e.wind;
      }
      return null;
    }).toList();

    final List<Main?> listMain = getWeather.list!.map((e) {
      if (e.main != null) {
        return e.main;
      }
      return null;
    }).toList();

    final List<List<Weather>?> listWeather = getWeather.list!.map((e) {
      if (e.weather != null) {
        return e.weather;
      }
      return null;
    }).toList();

    emit(state.copyWith(
      weatherStatus: WeatherStatus.loaded,
      weatherModel: getWeather,
      listModelOneDay: getWeather.list,
      listMain: listMain,
      city: getWeather.city,
      listWindForOneDay: listWind,
      listWeather: listWeather,
    ));
  }

  _getDaysWeatherEvent(
      GetDaysWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(weatherDaysStatus: WeatherDaysStatus.loading));

    final weatherDays = await weatherRepository.getDaysWeather(event.cityName);

    if (weatherDays == null) {
      return emit(state.copyWith(weatherDaysStatus: WeatherDaysStatus.error));
    }

    final List<Temp?> listTemp = weatherDays.list!.map((e) {
      if (e.temp != null) {
        return e.temp;
      }
      return null;
    }).toList();

    emit(state.copyWith(
      weatherDaysStatus: WeatherDaysStatus.loadedDays,
      weatherDaysModel: weatherDays,
      listModelFiveDays: weatherDays.list,
      listTemp: listTemp,
    ));
  }
}
