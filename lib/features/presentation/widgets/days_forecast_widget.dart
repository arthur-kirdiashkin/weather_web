import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/data/models/weather_model/weather_model.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_state.dart';

class DaysForecastWidget extends StatefulWidget {
  const DaysForecastWidget({super.key});

  @override
  State<DaysForecastWidget> createState() => _DaysForecastWidgetState();
}

class _DaysForecastWidgetState extends State<DaysForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherDaysBloc, WeatherDaysState>(
      builder: (context, state) {
        if (state.weatherDaysStatus == WeatherDaysStatus.loading) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 0.0,
                      offset: Offset(10, 10)),
                ]),
            width: 450,
            height: 366,
            child: Card(
              color: Theme.of(context).colorScheme.cardColor,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state.weatherDaysStatus == WeatherDaysStatus.loaded) {
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 0.0,
                        offset: Offset(10, 10)),
                  ]),
              width: 450,
              height: 366,
              child: Card(
                color: Theme.of(context).colorScheme.cardColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          '5 Days Forecast:',
                          style: TextStyle(
                            fontFamily: 'Popins',
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        )),
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: state.weatherDaysModel?.list!.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                getIcons(state.weatherDaysModel!.list![index]
                                    .weather![0].main)!,
                                SizedBox(
                                  width: 43,
                                ),
                                Text(
                                  '${state.weatherDaysModel!.list![index].temp!.day!.toInt()}°C',
                                  style: TextStyle(
                                    fontFamily: 'Popins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  width: 42,
                                ),
                                Text(
                                  '${DateFormat('EEEE, d MMM').format(DateTime.fromMillisecondsSinceEpoch(state.weatherDaysModel!.list![index].dt! * 1000))}',
                                  style: TextStyle(
                                    fontFamily: 'Popins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        } else if (state.weatherDaysStatus == WeatherStatus.error) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 0.0,
                  offset: Offset(10, 20)),
            ]),
            width: 510,
            height: 330,
            child: Card(
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  'Ошибка передачи данных',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

Widget? getIcons(String icon, [double width = 60, double height = 60]) {
  switch (icon) {
    case 'Clouds':
      return SvgPicture.asset(
        'assets/icons_two/cloudy.svg',
        width: width,
        height: height,
      );
    case 'Clear':
      return SvgPicture.asset(
        'assets/icons_two/sun.svg',
        width: width,
        height: height,
      );
    case 'Drizzle':
      return SvgPicture.asset(
        'assets/icons_two/drizzle.svg',
        width: width,
        height: height,
      );
    case 'Rain':
      return SvgPicture.asset(
        'assets/icons_two/rain.svg',
        width: width,
        height: height,
      );
  }
}
