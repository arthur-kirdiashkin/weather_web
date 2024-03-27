import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';
import 'package:weather_web/features/presentation/widgets/days_forecast_widget.dart';
import 'dart:math' as math;

class HourlyForecastWidget extends StatefulWidget {
  const HourlyForecastWidget({super.key});

  @override
  State<HourlyForecastWidget> createState() => _HourlyForecastWidgetState();
}

class _HourlyForecastWidgetState extends State<HourlyForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state.weatherStatus == WeatherStatus.loading) {
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
            width: 835,
            height: 366,
            child: Card(
              color: Theme.of(context).colorScheme.cardColor,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state.weatherStatus == WeatherStatus.loaded) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: Offset(10, 10)),
                ]),
            width: 835,
            height: 366,
            child: Card(
                color: Theme.of(context).colorScheme.cardColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        'Hourly Forecast:',
                        style: TextStyle(
                          fontFamily: 'Popins',
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        ),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: state.weatherModel!.list!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0, 1],
                                    colors: state.weatherModel!.list![index]
                                                .dt! <
                                            state.weatherModel!.list![3].dt!
                                        ? <Color>[
                                            Theme.of(context).colorScheme.cardDayColor,
                                            Theme.of(context).colorScheme.cardDayGradientColor
                                          ]
                                        : <Color>[
                                            Theme.of(context).colorScheme.cardNightColor,
                                            Theme.of(context).colorScheme.cardNightGradientColor
                                          ]),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              width: 130,
                              height: 250,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(state.weatherModel!.list![index].dt! * 1000))}',
                                    style: TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  getIcons(
                                      state.weatherModel!.list![index]
                                          .weather![0].main!,
                                      80,
                                      80)!,
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${state.weatherModel!.list![index].main!.temp!.toInt()}°C',
                                    style: TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                  getWindIcons(state
                                      .weatherModel!.list![index].wind!.deg!)!,
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    '${state.weatherModel!.list![index].wind!.speed!.toInt()}km/h',
                                    style: TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )),
          );
        } else if (state.weatherStatus == WeatherStatus.error) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 0.0,
                  offset: Offset(10, 20)),
            ]),
            width: 870,
            height: 336,
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

Widget? getWindIcons(int wind, [double width = 60, double height = 60]) {
  if (0 < wind && wind < 90) {
    return Image.asset('assets/icons_two/navigation 1.png');
  } else if (90 < wind && wind < 180) {
    return Transform.rotate(
        angle: 30 * math.pi / 180,
        child: Image.asset('assets/icons_two/navigation 1.png'));
  } else {
    return Transform.rotate(
        angle: 330 * math.pi / 180,
        child: Image.asset('assets/icons_two/navigation 1.png'));
  }
}
