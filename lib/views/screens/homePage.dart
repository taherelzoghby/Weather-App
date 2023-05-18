import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ap/controllers/weatherControl.dart';
import 'package:weather_ap/views/screens/searchPage.dart';
import 'package:weather_ap/views/screens/weatherView.dart';

import '../../services/weatherServices.dart';

class homePage extends StatelessWidget {
  WeatherService ws = WeatherService();
  @override
  Widget build(BuildContext context) {
    var watchData = context.watch<controlWeather>();

    return Scaffold(
      body:
          watchData.weather.isEmpty ? const searchPage() : const weatherView(),
    );
  }
}
