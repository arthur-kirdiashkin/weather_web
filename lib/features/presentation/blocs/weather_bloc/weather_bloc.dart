import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/features/data/repository/weather_repository.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_event.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherState()) {
    on<GetWeatherEvent> (_getWeatherEvent);
  }

  _getWeatherEvent(GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(weatherStatus: WeatherStatus.loading));
    final getWeather = await weatherRepository.getWeather(event.cityName);
    emit(state.copyWith(weatherStatus: WeatherStatus.loaded, weatherModel: getWeather));
  }
}