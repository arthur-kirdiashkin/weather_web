import 'package:flutter/material.dart';
import 'package:weather_web/features/presentation/widgets/days_forecast_widget.dart';
import 'package:weather_web/features/presentation/widgets/hourly_forecast_widget.dart';
import 'package:weather_web/features/presentation/widgets/name_card_widget.dart';
import 'package:weather_web/features/presentation/widgets/properties_card_widget.dart';
import 'package:weather_web/features/presentation/widgets/switch_widget.dart';
import 'package:weather_web/features/presentation/widgets/textfield_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 63,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SwitchWidget(),
                  const SizedBox(
                    width: 78,
                  ),
                  TextFieldWidget(),
                ],
              ),
              const SizedBox(
                height: 49,
              ),
              const Row(
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
              const SizedBox(
                height: 49,
              ),
              const Row(
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
