import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_event.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_state.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            Switch(
              thumbColor: const MaterialStatePropertyAll(Colors.black),
              trackColor: const MaterialStatePropertyAll(
                Color.fromRGBO(217, 217, 217, 1),
              ),
              activeColor: Colors.black,
              activeTrackColor: const Color.fromRGBO(217, 217, 217, 1),
              value: state.isDark ?? false,
              onChanged: (value) async {
                context.read<ThemeBloc>().add(ThemeChangedEvent(isDark: value));
              },
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              state.isDark == false ? 'Light Mode' : 'Dark Mode',
              style: TextStyle(
                color: state.isDark == false ? Colors.black : Colors.white,
                fontFamily: 'Popins',
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            )
          ],
        );
      },
    );
  }
}
