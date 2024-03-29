import 'package:intl/intl.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

class DataFormatUtils {
  static bool colorsCard(int index, WeatherModel weatherModel) {
    if (double.parse(DateFormat.H().format(DateTime.fromMillisecondsSinceEpoch(
                weatherModel.list![index].dt! * 1000))) <=
            18.0 &&
        double.parse(DateFormat.H().format(DateTime.fromMillisecondsSinceEpoch(
                weatherModel.list![index].dt! * 1000))) >=
            6.0) {
      return true;
    } else {
      return false;
    }
  }

  static String getTime(WeatherModel weatherModel) {
    String time = DateFormat.Hm().format(DateTime.now().add(Duration(
        seconds: weatherModel.city!.timezone! -
            DateTime.now().timeZoneOffset.inSeconds)));
    return time;
  }

  static String weekAndDay(WeatherModel weatherModel) {
    String weekAndDay = DateFormat('EEEE, d MMM').format(DateTime.now().add(
        Duration(
            seconds: weatherModel.city!.timezone! -
                DateTime.now().timeZoneOffset.inSeconds)));
    return weekAndDay;
  }

  static String weekAndDayFive(int index, WeatherModel weatherDaysModel) {
    String weekAndDayFive = DateFormat('EEEE, d MMM').format(
        DateTime.fromMillisecondsSinceEpoch(
            weatherDaysModel.list![index].dt! * 1000));
    return weekAndDayFive;
  }

  static String timeInHours(int index, WeatherModel weatherModel) {
    String timeInHours = DateFormat.Hm().format(
        DateTime.fromMillisecondsSinceEpoch(
            weatherModel.list![index].dt! * 1000));

    return timeInHours;
  }

  static String getClockInUtcPlus3Hours(int timeSinceEpochInSec) {
  final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
          isUtc: true)
      .add(const Duration(hours: 3));
  return '${time.hour}:${time.second} AM';
}
}
