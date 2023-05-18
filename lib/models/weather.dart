class Weather {
  String description;
  String conditions;
  DateTime datetime;
  String sunrise;
  String sunset;
  double cloudcover;
  String conditionStat;
  double humidity;
  double pressure;
  double uvindex;
  double feelslike;
  double temp;
  double tempmax;
  double tempmin;
  double windspeed;
  double winddir;
  double visibility;
  double snow;

  Weather({
    required this.description,
    required this.conditions,
    required this.datetime,
    required this.sunrise,
    required this.sunset,
    required this.cloudcover,
    required this.conditionStat,
    required this.humidity,
    required this.pressure,
    required this.uvindex,
    required this.feelslike,
    required this.temp,
    required this.tempmax,
    required this.tempmin,
    required this.windspeed,
    required this.winddir,
    required this.visibility,
    required this.snow,
  });

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(
      description: map['description'] ?? '',
      conditions: map['conditions'] ?? '',
      conditionStat: map['icon'] ?? '',
      humidity: map['humidity'] ?? 0.0,
      pressure: map['pressure'] ?? 0.0,
      uvindex: map['uvindex'] ?? 0.0,
      feelslike: map['feelslike'] ?? 0.0,
      temp: map['temp'] ?? 0.0,
      datetime: DateTime.parse(map['datetime']),
      windspeed: map['windspeed'] ?? 0.0,
      winddir: map['winddir'] ?? 0.0,
      sunrise: map['sunrise'] ?? '',
      sunset: map['sunset'] ?? '',
      visibility: map['visibility'] ?? 0.0,
      tempmax: map['tempmax'] ?? 0.0,
      tempmin: map['tempmin'] ?? 0.0,
      cloudcover: map['cloudcover'] ?? 0.0,
      snow: map['snow'] ?? 0.0,
    );
  }
  String getIcon() {
    if (cloudcover > .9) {
      return "assets/images/cloudy.png";
    } else if (cloudcover > .2 && conditionStat == "partly-cloudy-night") {
      return "assets/images/partly-cloudy-night.png";
    } else if (cloudcover <= .2 && conditionStat == "clear-night") {
      return "assets/images/clear-night.png";
    } else if (cloudcover > .2 && conditionStat == "partly-cloudy-day") {
      return "assets/images/partly-cloudy-day.png";
    } else if (cloudcover <= .2 && conditionStat == "clear-day") {
      return "assets/images/clear-day.png";
    } else if (snow > 0 && conditionStat == "snow") {
      return "assets/images/snow.png";
    } else if (conditionStat == "snow-showers-day") {
      return "assets/images/snow-showers-day.png";
    } else if (conditionStat == "snow-showers-night") {
      return "assets/images/snow-showers-night.png";
    } else if (conditionStat == "thunder-rain") {
      return "assets/images/thunder-rain.png";
    } else if (conditionStat == "thunder-showers-day") {
      return "assets/images/thunder-showers-day.png";
    } else if (conditionStat == "thunder-showers-night") {
      return "assets/images/thunder-showers-night.png";
    } else if (conditionStat == "rain") {
      return "assets/images/rain.png";
    } else if (conditionStat == "showers-day") {
      return "assets/images/showers-day.png";
    } else if (conditionStat == "showers-night") {
      return "assets/images/showers-night.png";
    } else if (conditionStat == "fog" && visibility < 1) {
      return "assets/images/fog.png";
    } else if (conditionStat == "wind" && windspeed > 30) {
      return "assets/images/wind.png";
    } else {
      return "assets/images/clear-day.png";
    }
  }
}
