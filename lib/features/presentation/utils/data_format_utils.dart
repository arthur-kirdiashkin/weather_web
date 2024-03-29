import 'package:intl/intl.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

class DataFormatUtils {
  static bool colorsCard(int index, WeatherModel weatherModel) {
    if (double.parse(dateFormatMilliSeconds(
                DateFormat.H(), weatherModel.list![index].dt!)) <=
            18.0 &&
        double.parse(dateFormatMilliSeconds(
                DateFormat.H(), weatherModel.list![index].dt!)) >=
            6.0) {
      return true;
    } else {
      return false;
    }
  }

  static String getTime(WeatherModel weatherModel) {
    String time = dateFormatSeconds(DateFormat.Hm(),
        weatherModel.city!.timezone! - DateTime.now().timeZoneOffset.inSeconds);

    return time;
  }

  static String weekAndDay(WeatherModel weatherModel) {
    String weekAndDay = dateFormatSeconds(DateFormat('EEEE, d MMM'),
        weatherModel.city!.timezone! - DateTime.now().timeZoneOffset.inSeconds);
    return weekAndDay;
  }

  static String weekAndDayFive(int index, WeatherModel weatherDaysModel) {
    String weekAndDayFive = dateFormatMilliSeconds(
        DateFormat('EEEE, d MMM'), weatherDaysModel.list![index].dt!);
    return weekAndDayFive;
  }

  static String timeInHours(int index, WeatherModel weatherModel) {
    String timeInHours =
        dateFormatMilliSeconds(DateFormat.Hm(), weatherModel.list![index].dt!);

    return timeInHours;
  }

  static String getClockInUtcPlus3Hours(int timeSinceEpochInSec) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
            isUtc: true)
        .add(const Duration(hours: 3));
    return '${time.hour}:${time.second} AM';
  }

  static String dateFormatMilliSeconds(
      DateFormat dateFormat, int milliseconds) {
    return dateFormat
        .format(DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000));
  }

  static String dateFormatSeconds(DateFormat dateFormat, int seconds) {
    return dateFormat.format(DateTime.now().add(Duration(seconds: seconds)));
  }
}
