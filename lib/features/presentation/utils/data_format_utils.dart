import 'package:intl/intl.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';

class DataFormatUtils {
  static bool colorsCard(int dt) {
    if (doubleParse(DateFormat.H(), dt) <= 18.0 &&
        doubleParse(DateFormat.H(), dt) >= 6.0) {
      return true;
    } else {
      return false;
    }
  }

  static String getTime(int timeZone) {
    String time = dateFormatSeconds(
        DateFormat.Hm(), timeZone - DateTime.now().timeZoneOffset.inSeconds);

    return time;
  }

  static String weekAndDay(int timeZone) {
    String weekAndDay = dateFormatSeconds(DateFormat('EEEE, d MMM'),
        timeZone - DateTime.now().timeZoneOffset.inSeconds);
    return weekAndDay;
  }

  static String weekAndDayFive(int dt) {
    String weekAndDayFive =
        dateFormatMilliSeconds(DateFormat('EEEE, d MMM'), dt);
    return weekAndDayFive;
  }

  static String timeInHours(int dt) {
    String timeInHours = dateFormatMilliSecondsHours(DateFormat.Hm(), dt);

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
    return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
      milliseconds * 1000,
    ));
  }

  static String dateFormatMilliSecondsHours(
      DateFormat dateFormat, int milliseconds) {
    return dateFormat.format(
      DateTime.fromMillisecondsSinceEpoch(
        milliseconds * 1000,
      ).subtract(
        Duration(hours: 3),
      ),
    );
  }

  static String dateFormatSeconds(DateFormat dateFormat, int seconds) {
    return dateFormat.format(DateTime.now().add(Duration(seconds: seconds)));
  }

  static double doubleParse(DateFormat dateFormat, int milliseconds) {
    return double.parse(dateFormatMilliSeconds(dateFormat, milliseconds));
  }
}
