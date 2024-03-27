import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/features/data/repository/weather_repository.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_event.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_state.dart';

class WeatherDaysBloc extends Bloc<WeatherDaysEvent, WeatherDaysState> {
  final WeatherRepository weatherRepository;
  WeatherDaysBloc({required this.weatherRepository})
      : super(WeatherDaysState()) {
    on<GetWeatherDaysEvent>(_getWeatherDaysEvent);
  }

  _getWeatherDaysEvent(
      GetWeatherDaysEvent event, Emitter<WeatherDaysState> emit) async {
    emit(state.copyWith(weatherDaysStatus: WeatherDaysStatus.loading));
    final getWeather = await weatherRepository.getDaysWeather(event.cityName);
    emit(state.copyWith(
        weatherDaysStatus: WeatherDaysStatus.loaded, weatherDaysModel: getWeather));
  }
}
