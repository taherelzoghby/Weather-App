import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class temp_condition extends StatelessWidget {
  const temp_condition({
    super.key,
    required this.height,
    required this.width,
    required this.temp,
    required this.condition,
    required this.tempmin,
    required this.tempmax,
    required this.icon,
  });

  final double height;
  final double width;
  final double temp;
  final double tempmin;
  final double tempmax;
  final String condition;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .3,
      width: width * .8,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Text(
              "$temp°C",
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Text(
              "$tempmin°C / $tempmax°C",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: textColor,
              ),
            ),
            Text(
              "$condition ",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
            SizedBox(
              child: Image.asset(icon),
            ),
          ],
        ),
      ),
    );
  }
}
