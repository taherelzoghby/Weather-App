import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_ap/models/weather.dart';

class WeatherService {
  String? timeZone;

  String apiKey = 'P6B2KP38T44CDREH3EELY62VD';
  Future<List<Weather>> getWeather(
      {String? city = 'Tanta', required BuildContext context}) async {
    List<Weather> forecastList = [];
    if (city == null || city.isEmpty) {
      throw Exception('Invalid city!');
    }
    try {
      Uri url = Uri.parse(
          "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/${Uri.encodeComponent(city)}?unitGroup=metric&include=days&key=$apiKey&contentType=json");
      http.Response result = await http.get(url);

      if (result.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(result.body);

        timeZone = jsonData['timezone'];
        List<dynamic> data = jsonData["days"];

        for (int i = 0; i < data.length; i++) {
          Weather forecast = Weather.fromJson(data[i]);
          forecastList.add(forecast);
        }
      } else {
        throw Exception("Invalid response!");
      }
    } catch (e) {
      print("Error : $e");
    }
    return forecastList;
  }
}
