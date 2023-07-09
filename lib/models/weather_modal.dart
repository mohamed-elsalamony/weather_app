import 'package:flutter/material.dart';

class WeatherModel {
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherStateName;
  WeatherModel(
      {required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.weatherStateName});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
        date: data["location"]["localtime"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        temp: jsonData["avgtemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }
  @override
  String toString() {
    // TODO: implement toString
    return "temp = $temp    date = $date weatherState = $weatherStateName $maxTemp  $minTemp";
  }

  String getImage() {
    if (weatherStateName == "Clear" || weatherStateName == "Light Cloud") {
      return "assets/images/clear.png";
    } else if (weatherStateName == "Sleet" ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return "assets/images/snow.png";
    } else if (weatherStateName == "Heavy Cloud") {
      return "assets/images/cloudy.png";
    } else if (weatherStateName == "Light Rain" ||
        weatherStateName == "Heavy Rain" ||
        weatherStateName == "Showers") {
      return "assets/images/rainy.png";
    }else{
      return "assets/images/clear.png";
    }
  }
    MaterialColor getColorTheme() {
    if (weatherStateName == "Clear" || weatherStateName == "Light Cloud") {
      return Colors.blue;
    } else if (weatherStateName == "Sleet" ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return Colors.blue;
    } else if (weatherStateName == "Heavy Cloud") {
      return Colors.blueGrey;
    } else if (weatherStateName == "Light Rain" ||
        weatherStateName == "Heavy Rain" ||
        weatherStateName == "Showers") {
      return Colors.blue;
    }else{
      return Colors.orange;
    }
  }

}
