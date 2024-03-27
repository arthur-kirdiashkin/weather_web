import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_event.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_state.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_event.dart';
import 'package:weather_web/features/presentation/blocs/weather_bloc/weather_state.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_bloc.dart';
import 'package:weather_web/features/presentation/blocs/weather_days_bloc/weather_days_event.dart';
import 'package:weather_web/features/presentation/widgets/days_forecast_widget.dart';
import 'package:weather_web/features/presentation/widgets/hourly_forecast_widget.dart';
import 'package:weather_web/features/presentation/widgets/name_card_widget.dart';
import 'package:weather_web/features/presentation/widgets/properties_card_widget.dart';
import 'package:weather_web/features/presentation/widgets/switch_widget.dart';
import 'package:weather_web/features/presentation/widgets/textfield_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cityController = TextEditingController();
  bool isDark = false;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 63,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SwitchWidget(),
                  SizedBox(
                    width: 78,
                  ),
                  TextFieldWidget(),
                ],
              ),
              SizedBox(
                height: 49,
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: NameCardWidget(),
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: PropertiesCardWidget(),
                  ),
                ],
              ),
              SizedBox(
                height: 49,
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: DaysForecastWidget(),
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: HourlyForecastWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
