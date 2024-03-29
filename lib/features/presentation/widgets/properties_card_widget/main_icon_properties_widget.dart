import 'package:flutter/material.dart';
import 'package:weather_web/common/constants.dart';
import 'package:weather_web/features/data/models/weather_model/list_model.dart';
import 'package:weather_web/features/presentation/utils/methods_utils.dart';

class MainIconPropertiesWidget extends StatelessWidget {
  final List<ListModel> list;

  const MainIconPropertiesWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MethodUtils.getLottieIcons(
                list[0].weather![0].main!, 220, 220) ??
            Image.network(
              NOT_IMAGE_URL,
              width: 220,
              height: 220,
            ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${list[0].weather![0].main}',
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
