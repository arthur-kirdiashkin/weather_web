import 'package:flutter/material.dart';
import 'package:weather_web/common/constants.dart';
import 'package:weather_web/features/data/models/weather_model/list_model.dart';
import 'package:weather_web/features/presentation/utils/methods_utils.dart';

class MainIconPropertiesWidget extends StatelessWidget {
  final String main;

  const MainIconPropertiesWidget({super.key, required this.main});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MethodUtils.getLottieIcons(
              main,
              220,
              220,
            ) ??
            Image.network(
              NOT_IMAGE_URL,
              width: 220,
              height: 220,
            ),
        const SizedBox(
          height: 10,
        ),
        Text(
          main,
          style: const TextStyle(
            fontFamily: 'Popins',
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        )
      ],
    );
  }
}
