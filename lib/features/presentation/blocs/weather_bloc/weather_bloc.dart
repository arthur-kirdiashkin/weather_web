import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/features/data/models/weather_model/general_data.dart';
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

    final List<Wind?> listOfWind = [];

    final List<Weather?> listOfWeatherOneDay = [];

    final List<GeneralData?> listOfGeneralData = [];

    for (var listWeatherData in getWeather.listWeatherData!) {
      listOfWind.add(listWeatherData.wind);
      listOfWeatherOneDay.add(listWeatherData.weather);
      listOfGeneralData.add(listWeatherData.generalData);
    }

    emit(state.copyWith(
      weatherStatus: WeatherStatus.loaded,
      weatherModel: getWeather,
      listModelOneDay: getWeather.listWeatherData,
      listGeneralData: listOfGeneralData,
      city: getWeather.city,
      listWindForOneDay: listOfWind,
      listWeatherOneDay: listOfWeatherOneDay,
      currentData: listOfGeneralData.first,
      currentWindSpeed: listOfWind.first,
      currentDesciptionWeather: listOfWeatherOneDay.first
      
    ));
  }

  _getDaysWeatherEvent(
      GetDaysWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(weatherDaysStatus: WeatherDaysStatus.loading));

    final weatherDays = await weatherRepository.getDaysWeather(event.cityName);

    if (weatherDays == null) {
      return emit(state.copyWith(weatherDaysStatus: WeatherDaysStatus.error));
    }

    final List<Temp?> listOfTemp = [];

    final List<Weather?> listOfWeatherFiveDays = [];

    for (var listWeatherData in weatherDays.listWeatherData!) {
      listOfTemp.add(listWeatherData.temp);
      listOfWeatherFiveDays.add(listWeatherData.weather);
    }

    emit(state.copyWith(
      weatherDaysStatus: WeatherDaysStatus.loadedDays,
      weatherDaysModel: weatherDays,
      listModelFiveDays: weatherDays.listWeatherData,
      listTemp: listOfTemp,
      listWeatherFiveDays: listOfWeatherFiveDays,
    ));
  }
}
