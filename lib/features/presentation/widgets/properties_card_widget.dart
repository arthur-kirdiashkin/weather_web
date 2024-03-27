
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/common/themes/app_themes.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';
import 'package:lottie/lottie.dart';

class PropertiesCardWidget extends StatefulWidget {
  const PropertiesCardWidget({super.key});

  @override
  State<PropertiesCardWidget> createState() => _PropertiesCardWidgetState();
}

class _PropertiesCardWidgetState extends State<PropertiesCardWidget> {
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
                      blurRadius: 5.0, 
                      spreadRadius: 0.0,
                      offset: const Offset(10, 10)),
                ]),
            width: 780,
            height: 330,
            child: Card(
              color: Theme.of(context).colorScheme.cardColor,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
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
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 0.0,
                      offset: const Offset(10, 10)),
                ]),
            width: 780,
            height: 330,
            child: Card(
                color: Theme.of(context).colorScheme.cardColor,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, top: 26),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '${state.weatherModel!.list![0].main!.temp!.ceil()}°C',
                            style: const TextStyle(
                              height: 1,
                              fontFamily: 'Popins',
                              fontWeight: FontWeight.w700,
                              fontSize: 80,
                            ),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Feels like:',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .iconColor,
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20)),
                              TextSpan(
                                  text:
                                      ' ${state.weatherModel!.list![0].main!.feelsLike!.ceil()}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .iconColor,
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32)),
                              TextSpan(
                                text: '°C',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.iconColor,
                                    fontFamily: 'Popins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32),
                              )
                            ]),
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/sunrise-white 1.png',
                                color: Theme.of(context).colorScheme.iconColor,
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sunrice',
                                    style: TextStyle(
                                        fontFamily: 'Popins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    '${getClockInUtcPlus3Hours(state.weatherModel!.city!.sunrise!)}',
                                    style: const TextStyle(
                                        fontFamily: 'Popins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/sunset-white 1.png',
                                color: Theme.of(context).colorScheme.iconColor,
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sunrset',
                                    style: TextStyle(
                                        fontFamily: 'Popins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    '${getClockInUtcPlus3Hours(state.weatherModel!.city!.sunset!)}',
                                    style: const TextStyle(
                                        fontFamily: 'Popins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          getLottieIcons(
                              state.weatherModel!.list![0].weather![0].main!,
                              220,
                              220)!,
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${state.weatherModel!.list![0].weather![0].main}',
                            style: const TextStyle(
                              fontFamily: 'Popins',
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons_two/humidity.png',
                                    color:
                                        Theme.of(context).colorScheme.iconColor,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    '${state.weatherModel!.list![0].main!.humidity}%',
                                    style: const TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  const Text(
                                    'Humidity',
                                    style: TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons_two/wind.png',
                                    color:
                                        Theme.of(context).colorScheme.iconColor,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${state.weatherModel!.list![0].wind!.speed!.ceil()}km/h',
                                    style: const TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  const Text(
                                    'Wind Speed',
                                    style: TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons_two/pressure.png',
                                    color:
                                        Theme.of(context).colorScheme.iconColor,
                                  ),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  Text(
                                    '${state.weatherModel!.list![0].main!.pressure}hPa',
                                    style: const TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  const Text(
                                    'Pressure',
                                    style: TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 55,
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons_two/sealevel.png',
                                    color: Theme.of(context).colorScheme.iconColor,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${state.weatherModel!.list![0].main!.seaLevel}',
                                    style: const TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  const Text(
                                    'Sea level',
                                    style: TextStyle(
                                      fontFamily: 'Popins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
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
                  offset: const Offset(10, 20)),
            ]),
            width: 510,
            height: 330,
            child: Card(
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                child: Text(
                  'Ошибка передачи данных',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  String? getClockInUtcPlus3Hours(int timeSinceEpochInSec) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
            isUtc: true)
        .add(const Duration(hours: 3));
    return '${time.hour}:${time.second} AM';
  }
}

Widget? getLottieIcons(String icon, [double width = 60, double height = 60]) {
  switch (icon) {
    case 'Clouds':
      return Lottie.network(
        'https://lottie.host/baec878d-22f8-4e9e-b06c-fd89532e0da7/zB9f5Ykbbj.json',
        width: width,
        height: height,
        animate: true,
        repeat: true,
      );
    case 'Clear':
      return Lottie.network(
        'https://lottie.host/ac0f660a-3b35-4fd6-b3b3-a06aa1c3814b/FwMYnXZSY9.json',
        width: width,
        height: height,
        animate: true,
        repeat: true,
      );
    case 'Drizzle':
      return Lottie.network(
        'https://lottie.host/73e1552f-a21e-42fc-94f6-276313ace6d7/LzOgoQEH3b.json',
        width: width,
        height: height,
        animate: true,
        repeat: true,
      );
    case 'Rain':
      return Lottie.network(
        'https://lottie.host/69f5fc22-9009-4099-abc1-46c9a567c5ea/cmgYwE9xzw.json',
        width: width,
        height: height,
        animate: true,
        repeat: true,
      );
  }
}
