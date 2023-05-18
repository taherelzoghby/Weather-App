import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_ap/models/weather.dart';

class infoTileForecast extends StatelessWidget {
  const infoTileForecast({
    super.key,
    required this.height,
    required this.forcast,
  });

  final double height;
  final Weather forcast;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .09,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              DateFormat('MM-dd').format(forcast.datetime),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text("${forcast.tempmin}°"),
            Text(
              "${forcast.temp}°",
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.width * .2,
              child: Image.asset(
                forcast.getIcon(),
              ),
            ),
            Text("${forcast.tempmax}°"),
          ],
        ),
      ),
    );
  }
}
