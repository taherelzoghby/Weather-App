import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ap/controllers/weatherControl.dart';
import 'package:weather_ap/views/widgets/infoTileForecast.dart';

class forcast_15_Page extends StatelessWidget {
  const forcast_15_Page({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var watchData = context.watch<controlWeather>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '15-day forecast',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: watchData.weather.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: infoTileForecast(
                      height: height,
                      forcast: watchData.weather[index]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
