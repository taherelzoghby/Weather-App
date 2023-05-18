import 'package:flutter/material.dart';
import 'package:weather_ap/views/screens/homePage.dart';

import '../models/weather.dart';
import '../services/weatherServices.dart';

// ignore: camel_case_types
class controlWeather with ChangeNotifier {
  WeatherService weatherService = WeatherService();
  List<Weather?> _weather = [];
  String? city;
  set weatherData(List<Weather>? w) {
    _weather = w!;
    notifyListeners();
  }

  List<Weather?> get weather => _weather;

  Future<void> searchCity(value, context) async {
    city = value;
    weatherData = await weatherService.getWeather(city: city, context: context);
    if (weather.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please, Enter valid city!')),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => homePage(),
        ),
      );
    }
    notifyListeners();
  }
}
