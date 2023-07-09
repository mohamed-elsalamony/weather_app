import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_modal.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "4d19e8a007994f2fa4b211858231802";
  WeatherModel? weather;
  Future<WeatherModel?> getWeather({required String nameCity}) async {
    try {
      Uri url = Uri.parse(
          "$baseUrl/forecast.json?key= $apiKey &q=$nameCity&days=1&aqi=no&alerts=no");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
