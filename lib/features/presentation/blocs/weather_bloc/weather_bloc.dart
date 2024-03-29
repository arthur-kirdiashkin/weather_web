import 'package:flutter_bloc/flutter_bloc.dart';
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

    emit(state.copyWith(
      weatherStatus: WeatherStatus.loaded,
      weatherModel: getWeather,
      listModelOneDay: getWeather.list,
    ));
  }

  _getDaysWeatherEvent(
      GetDaysWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(weatherDaysStatus: WeatherDaysStatus.loading));

    final weatherDays = await weatherRepository.getDaysWeather(event.cityName);

    if (weatherDays == null) {
      return emit(state.copyWith(weatherDaysStatus: WeatherDaysStatus.error));
    }

    emit(state.copyWith(
      weatherDaysStatus: WeatherDaysStatus.loadedDays,
      weatherDaysModel: weatherDays,
      listModelFiveDays: weatherDays.list,
    ));
  }
}
