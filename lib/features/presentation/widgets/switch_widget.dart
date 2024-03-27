import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:weather_web/features/presentation/blocs/theme_bloc/theme_event.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          thumbColor: const MaterialStatePropertyAll(Colors.black),
          trackColor: const MaterialStatePropertyAll(
            Color.fromRGBO(217, 217, 217, 1),
          ),
          activeColor: Colors.black,
          activeTrackColor: const Color.fromRGBO(217, 217, 217, 1),
          value: isDark,
          onChanged: (value) async {
            setState(() {
              isDark = !isDark;
            });
            context.read<ThemeBloc>().add(ThemeChangedEvent(isDark: isDark));
          },
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          isDark == false ? 'Light Mode' : 'Dark Mode',
          style: TextStyle(
            color: isDark == false ? Colors.black : Colors.white,
            fontFamily: 'Popins',
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
